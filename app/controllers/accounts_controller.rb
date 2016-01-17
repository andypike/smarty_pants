class AccountsController < ApplicationController
  def new
    @form = Accounts::SignUpForm.new
  end

  def create
    @form = Accounts::SignUpForm.from_params(params)

    Accounts::SignUp.call(@form) do
      on(:ok)      { redirect_to children_path, :notice => t(:signed_up) }
      on(:invalid) { render :new }

      on(:race_non_unique_email) do
        flash.now[:alert] = t(:email_taken)
        render :new
      end
    end
  end
end
