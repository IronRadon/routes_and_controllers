class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :user_id
  validates :names, :email, :user_id, :presence => true
  validates :email, :uniqueness => true

  belongs_to(:user,
             :class_name => 'User',
             :primary_key => 'id',
             :foreign_key => 'user_id')
  has_many(
    :users_shared,
    :class_name => "ContactShare",
    :primary_key => :id,
    :foreign_key => :contact_id
  )

  has_many :users_shared_to, :through => :users_shared, :source => :shared_user
end