# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

user1 = User.create!(:name => "Gordon Ramsey", :email => "straight.g@restaurants.com")
user2 = User.create!(:name => "Austin Powers", :email => "yeah.baby@austin.com")
user3 = User.create!(:name => "NOT Dan", :email => "notdan@definitelynotdan.com")

c1 = Contact.create!(:name => "Gordon Ramsey's Mom",
                :email => "bestmom@gordonramsey.com", :user_id => user1.id,
                :favorite => true)
c2 = Contact.create!(:name => "Austin's Mom", :email => "bestmom@austin.com",
                :user_id => user2.id, :favorite => true)
c3 = Contact.create!(:name => "NOT Fern", :email => "notfern@definitelynotfern.com",
                :user_id => user3.id, :favorite => false)

share1 = ContactShare.create!(:contact_id => c1.id, :user_id => user2.id)
share2 = ContactShare.create!(:contact_id => c3.id, :user_id => user2.id)
share3 = ContactShare.create!(:contact_id => c2.id, :user_id => user1.id)

group1 = Group.create!(:user_id => user1.id)
group2 = Group.create!(:user_id => user2.id)
group3 = Group.create!(:user_id => user3.id)

gm1 = GroupMembership.create!(:group_id => group1.id, :contact_id => c1.id)
gm2 = GroupMembership.create!(:group_id => group1.id, :contact_id => c2.id)

gm3 = GroupMembership.create!(:group_id => group2.id, :contact_id => c1.id)
gm4 = GroupMembership.create!(:group_id => group2.id, :contact_id => c3.id)

gm5 = GroupMembership.create!(:group_id => group3.id, :contact_id => c1.id)
gm6 = GroupMembership.create!(:group_id => group3.id, :contact_id => c2.id)

end