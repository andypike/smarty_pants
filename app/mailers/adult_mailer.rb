class AdultMailer < ActionMailer::Base
  layout "mail"

  def welcome(adult)
    @adult = adult

    mail(:to => adult.email, :subject => I18n.t(:welcome_email_subject))
  end
end
