class Group < ActiveRecord::Base

  attr_accessible :user_id
  validates :user_id, :presence => true

  belongs_to(:user,
             :class_name => 'User',
             :primary_key => 'id',
             :foreign_key => 'user_id')

  has_many( :memberships,
            :class_name => 'GroupMembership',
            :primary_key => 'id',
            :foreign_key => 'group_id')

  has_many( :contacts, :through => :memberships, :source => :contact)

  def self.groups_for_user_id(user_id)
    self.select("DISTINCT *")
        .where({ :user_id => user_id })
  end
end