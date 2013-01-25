class Invoice < ActiveRecord::Base
  attr_accessible :issued, :issued_date
  has_many :time_entries
  belongs_to :account
  belongs_to :user
end
