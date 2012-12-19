#encoding: utf-8
Mail.defaults do
  retriever_method :imap,
    :user_name => 'openteam@dekonix.ru',
    :password => 'openteam123456789',
    :address => 'imap.gmail.com',
    :port => 993,
    :enable_ssl => true
end
desc "Получение email"
task email_checker: :environment do
  Mail.all.each do |mail|
    if mail.multipart?
      p mail.parts[0].body.to_s
      body = mail.parts[0].body.to_s
    else
      p mail.body.to_s
      body = mail.body.to_s
    end
  #Email.create! :subject => mail.subject, :body => body
  end
end
