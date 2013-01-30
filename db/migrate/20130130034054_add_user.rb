class AddUser < ActiveRecord::Migration
  def up
    User.new(:email)
  end

  def down
  end
end
