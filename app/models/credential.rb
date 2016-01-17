class Credential < ActiveRecord::Base
  has_secure_password

  belongs_to :owner, :polymorphic => true

  def self.find_by_username(username)
    where(
      "lower(username) = lower(:username)", :username => username
    ).first
  end
end
