class User < ActiveRecord::Base

  attr_accessible :name, :email
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true

  has_many(:contacts,
           :class_name => 'Contact',
           :primary_key => 'id',
           :foreign_key => 'user_id')

  has_many(
     :contacts_shared_to,
     :primary_key => :id,
     :foreign_key => :user_id,
     :class_name => "ContactShare"
     )

  has_many( :groups,
            :class_name => 'Group',
            :primary_key => 'id',
            :foreign_key => 'user_id')

  has_many( :comments,
            :class_name => 'Comment',
            :primary_key => 'id',
            :foreign_key => 'user_id')

  has_many :contacts_shared, :through => :contacts_shared_to, :source => :contact



end