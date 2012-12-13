class NotificationsController < ApplicationController
  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notifications }
    end
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    @notification = Notification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notification }
    end
  end

  # GET /notifications/new
  # GET /notifications/new.json
  def new
    @notification = Notification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notification }
    end
  end

  # GET /notifications/1/edit
  def edit
    @notification = Notification.find(params[:id])
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(params[:notification])

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render json: @notification, status: :created, location: @notification }
      else
        format.html { render action: "new" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notifications/1
  # PUT /notifications/1.json
  def update
    @notification = Notification.find(params[:id])

    respond_to do |format|
      if @notification.update_attributes(params[:notification])
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :no_content }
    end
  end





  def generate_dep_rep_notification(from , to , message, subject) #generates and sends an email to member of department user group
    

    @smtp_info = {
    :smtp_server => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :username => "myEMAIL",
    :password => "pass",
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

  def generate_status_update_notification #generates and sends emails to all users related to the current stage of the cta

  end
end
