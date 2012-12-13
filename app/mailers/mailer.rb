class Mailer < ActionMailer::Base
  default from: "bidmctest@gmail.com"

  def dep_rep_notification(user, form)
  	@user = user
  	@form = form
  	mail(to: 'deprepxray@gmail.com', subject: 'Your action is required on a CTA')
  end

  def cci_notification(user, cta)
  	@user = user
  	@cta = cta
  	mail(to: 'deprepxray@gmail.com', subject: 'Your action is required on a CTA')
  end
end
