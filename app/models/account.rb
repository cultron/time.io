class Account < ActiveRecord::Base
  attr_accessible :contact_email, :contact_name, :creation_date, :name, :rate
  has_many :invoices
  has_many :time_entries
end
