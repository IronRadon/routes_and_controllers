class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :user_id, :favorite
  validates :name, :email, :user_id, :presence => true
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

  def self.contacts_for_user_id(user_id)
    self.select("DISTINCT *")
        .joins("LEFT OUTER JOIN contact_shares
                ON contacts.id = contact_shares.contact_id")
        .where("#{user_id} = contact_shares.user_id
                OR contacts.user_id = #{user_id}")
  end

  def self.favorite_contacts_for_user_id(user_id)
    self.select("DISTINCT *")
        .where({:user_id => user_id, :favorite => true})
  end
end