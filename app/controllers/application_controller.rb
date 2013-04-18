class ApplicationController < ActionController::Base
  protect_from_forgery

before_filter :set_globals

  def set_globals
    if !current_user.nil?
      @invoices = Invoice.where(:user_id => current_user.id).order("created_at ASC")
      @time_entries = TimeEntry.where(:user_id => current_user.id)
      @accounts = current_user.accounts
    end
  end
end
