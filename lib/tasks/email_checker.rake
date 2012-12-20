#encoding: utf-8
desc "Получение email"
task email_checker: :environment do
  gmail = Gmail.connect('openteam@dekonix.ru', 'openteam123456789')
  if gmail.inbox.count(:unread)
    gmail.inbox.emails(:unread).each do |mail|
      p mail.subject
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
      p "Body: #{body}"
    end
  end
  gmail.logout
end
