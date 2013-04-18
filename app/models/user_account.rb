class UserAccount < ActiveRecord::Base
  attr_accessible :user_id, :account_id
  belongs_to :user
  belongs_to :account
end