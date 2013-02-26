module TimeEntriesHelper

  def TotalMoneyEarned()
    total = 0
    TimeEntry.all.each do |t|
       total += t.hours * t.account.rate
    end
    "$#{total}"
  end

  def TotalMoneyOwed()
    total = 0
    TimeEntry.invoiced?.each do |t|
      total += t.hours * t.account.rate unless t.invoice.paid
    end
    TimeEntry.invoiced!.each do |t|
      total += t.hours * t.account.rate
    end
    "$#{total}"
  end
end
