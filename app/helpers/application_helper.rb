module ApplicationHelper
  def TotalMoneyEarned(time_entries)
    total = 0
    time_entries.each do |t|
      total += t.hours * t.account.rate
    end
    "$#{total}"
  end

  def TotalMoneyOwed(time_entries)
    total = 0
    time_entries.invoiced?.each do |t|
      total += t.hours * t.account.rate unless t.invoice.paid
    end
    time_entries.invoiced!.each do |t|
      total += t.hours * t.account.rate
    end
    "$#{total}"
  end
end
