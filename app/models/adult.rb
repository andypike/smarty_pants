class Adult < ActiveRecord::Base
  belongs_to :account
  has_one :credential, :as => :owner
end
