class TimeEntry < ActiveRecord::Base
  attr_accessible :date, :description, :hours
  belongs_to :user
  belongs_to :account
  belongs_to :invoice
end
