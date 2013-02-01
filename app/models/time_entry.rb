class TimeEntry < ActiveRecord::Base
  attr_accessible :date, :description, :hours, :user, :account, :invoice, :user_id, :account_id, :invoice_id
  belongs_to :user
  belongs_to :account
  belongs_to :invoice

  class << self
    def invoiced?
      TimeEntry.where("time_entries.invoice_id in (select invoices.id from invoices)")
    end
    def invoiced!
      TimeEntry.where(:invoice_id => nil)
    end
  end

end
