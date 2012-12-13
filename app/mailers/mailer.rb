class Mailer < ActionMailer::Base
  default from: "bidmctest@gmail.com"

  def dep_rep_notification(user, form)
  	@user = user
  	@form = form
  	mail(to: 'deprepxray@gmail.com', subject: 'Your action is required on a CTA')
  end
end
