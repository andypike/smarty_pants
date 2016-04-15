class Credential < ActiveRecord::Base
  has_secure_password

  belongs_to :owner, :polymorphic => true
end
