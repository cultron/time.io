class Invoice < ActiveRecord::Base
  attr_accessible :issued, :issued_date, :id, :paid, :hours
  has_many :time_entries
  belongs_to :account
  belongs_to :user

  def hours
    self.time_entries.sum(:hours).to_s
  end

  def amount
    (self.time_entries.sum(:hours) * self.account.rate).to_s
  end

end
