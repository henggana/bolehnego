# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[[1, 'super-admin'],[2, 'admin'],[3, 'customer']].each do |element|
    Usertype.create(:id => element[0], :name => element[1])
end

  
  userlogin = Userlogin.create(
                                :email => 'sadmin@bolehnego.com',
                                :password => 'sadmin',
                                :password_confirmation => 'sadmin',
                                :usertype_id => 1
                                )
