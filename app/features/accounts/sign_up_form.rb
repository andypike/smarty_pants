module Accounts
  class SignUpForm < Rectify::Form
    mimic :account

    attribute :first_name, String
    attribute :last_name,  String
    attribute :email,      String
    attribute :password,   String
    attribute :password_confirmation, String
  end
end
