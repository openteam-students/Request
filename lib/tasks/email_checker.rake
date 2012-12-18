# encoding: utf-8
Mail.defaults do
  retriever_method :imap,
    :address    => "imap.gmail.com",
    :port       => 993,
    :user_name  => 'openteam@dekonix.ru',
    :password   => 'openteam123456789',
    :enable_ssl => true
end
desc "Opisanie"
task :email_checker => :environment do
  Mail.all.each do |mail|
    
	if mail.multipart? then p mail.parts[0].body.to_s
		Email.create! :subject => mail.subject, :body => mail.parts[0].body.to_s
else p mail.body.to_s
	Email.create! :subject => mail.subject, :body => mail.body.to_s
end

  end
  

