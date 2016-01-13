class AccountsController < ApplicationController
  def new
    @form = Accounts::SignUpForm.new
  end
end
