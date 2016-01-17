module Accounts
  class SignUp < Rectify::Command
    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid) if form.invalid?

      transaction do
        create_account
        add_adult_to_account
        send_welcome_email
      end

      broadcast(:ok)

    rescue ActiveRecord::RecordNotUnique
      broadcast(:race_non_unique_email)
    end

    private

    attr_reader :form, :account, :adult

    def create_account
      @account ||= Account.create
    end

    def add_adult_to_account
      @adult = account.adults.create(
        form.attributes.slice(:first_name, :last_name, :email)
      )

      adult.create_credential(
        :username => form.email,
        :password => form.password,
        :password_confirmation => form.password_confirmation
      )
    end

    def send_welcome_email
      AdultMailer.welcome(adult).deliver_now
    end
  end
end
