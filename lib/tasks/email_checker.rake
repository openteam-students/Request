#encoding: utf-8
desc "Получение email"
task email_checker: :environment do

  #settings=Settings.read('config/settings.yml')

  #hash = Hashie::Mash.new(settings)
#    login=hash.mail.tusur.login
 #   password=hash.mail.tusur.password

 yml = Hashie::Mash.new(YAML.load_file(Rails.root.join('config', 'settings.yml')))

 yml.mail.each do |_, mail_attributes|
    login=mail_attributes.login
    password=mail_attributes.password

    gmail = Gmail.connect(login, password)
    if gmail.inbox.count(:unread)
    pb = ProgressBar.new(gmail.inbox.count(:unread))
      gmail.inbox.emails(:unread).each do |mail|
        # p mail.subject
        if mail.multipart?
          if mail.text_part.nil?
            if !mail.html_part.nil?
              body = mail.html_part.body
            end
          else
            body = mail.text_part.body
          end
        else
          body = mail.body
        end
        # p "Body: #{body}"
        pb.increment!
      end
    end
    gmail.logout
 end
end
