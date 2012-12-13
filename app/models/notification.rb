require 'tlsmail'

class Notification < ActiveRecord::Base
  attr_accessible :message, :user_id

  def self.generate_dep_rep_notification(from , to , message, subject) #generates and sends an email to member of department user group
    @smtp_info = {
    :smtp_server => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :username => "bidmctest@gmail.",
    :password => "panama123",
    :authentication => "plain" , 
    :enable_starttls_auto => true
    }
    begin 
          Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
          Net::SMTP.start(@smtp_info[:smtp_server], @smtp_info[:port], @smtp_info[:domain], @smtp_info[:username], @smtp_info[:password], @smtp_info[:authentication]) do |smtp|
            
          mailtext = <<EOF
            From: #{from}
            To: #{to}
            Subject: #{subject}
 
            #{message}

EOF

          smtp.send_message mailtext, from, to
    end
  
    rescue => e  
      raise "Exception occured: #{e} "
        exit -1
    end
  end

  def self.generate_status_update_notification #generates and sends emails to all users related to the current stage of the cta

  end
end
