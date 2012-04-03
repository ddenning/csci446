# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role_admin = Role.create!(	:name => "admin",
														:description => "Can manage games, users, and roles.")

role_member = Role.create!(	:name => "member",
														:description => "Can read games, create games, edit and destroy games they've created, and edit their own profiles.")

admin = User.create!(	:username => "administrator",
											:password => "password",
											:password_confirmation => "password",
											:first_name => "John",
											:last_name => "Doe",
											:email => "admin@admin.adm",
											:role_id => Role.find_by_name("admin").id)

member = User.create!(	:username => "member", 
												:password => "password",
												:password_confirmation => "password",
												:first_name => "Jane", 
												:last_name => "Doe", 
												:email => "member@member.mem",
												:role_id => Role.find_by_name("member").id)

for i in 0..50 do
	Game.create!(	:title => "Game#{i}",
								:rating => "Meh",
								:user_id => member.id)
end