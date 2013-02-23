# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:id => 1, :email => "mscullerton@gmail.com", :encrypted_password => "$2a$10$UlBGHo1DCRQ4319.hGy0eeXhfksa1Wrv9/mH96V2xacK7pOJvimwW", :sign_in_count => 4, :current_sign_in_at => Wed, 30 Jan 2013 23:13:17 UTC +00:00, :last_sign_in_at => Wed, 30 Jan 2013 18:42:14 UTC +00:00, :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1")
Account.create(:id => 1, :name => "F#", :contact_name => "Pete Jimison", :contact_email => "ap@efsharp.com", :rate => 50, :creation_date => Wed, 30 Jan 2013 03:58:00 UTC +00:00)
Account.create(:id => 2, :name => "EMN8", :contact_name => "James Pinpin", :contact_email => "jpinpin@emn8.com", :rate => 75, :creation_date => Wed, 30 Jan 2013 04:03:00 UTC +00:00)
Invoice.create(:id => 2, :issued => true, :issued_date => Thu, 16 Aug 2012 00:24:00 UTC +00:00, :user_id => 1, :account_id => 1)
Invoice.create(:id => 3, :issued => true, :issued_date => Wed, 19 Sep 2012 00:00:00 UTC +00:00, :user_id => 1, :account_id => 1)
Invoice.create(:id => 4, :issued => true, :issued_date => Sun, 16 Dec 2012 00:00:00 UTC +00:00, :user_id => 1, :account_id => 1)

