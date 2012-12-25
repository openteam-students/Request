#encoding: utf-8
#require 'degist/md5'

def email_body(mail)
  if mail.multipart?
    if mail.text_part.nil?
      if !mail.html_part.nil?
        body = mail.html_part.body.to_s
      end
    else
      body = mail.text_part.body.to_s
    end
  else
    body = mail.body.to_s
  end
end

desc "Получение email"
task email_checker: :environment do
  yml = Hashie::Mash.new(YAML.load_file(Rails.root.join('config', 'settings.yml')))
  yml.mail.each do |_, mail_attributes|
    login=mail_attributes.login
    password=mail_attributes.password

    gmail = Gmail.connect(login, password)
    if gmail.inbox.count(:unread)
      pb = ProgressBar.new(gmail.inbox.count(:unread))
      gmail.inbox.emails(:unread).each do |mail|
        body = email_body(mail)
        #p body
        uid = Digest::MD5.hexdigest(mail.subject+body)
        Email.find_or_create_by_uid(:subject => mail.subject,
                                   :body => body,
                                   :uid => uid)
        pb.increment!
      end
      gmail.logout
    end
  end
end
