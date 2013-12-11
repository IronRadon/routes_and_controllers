class ContactShare < ActiveRecord::Base
  attr_accessible :user_id, :contact_id
  validates :user_id, :contact_id, :presence => true

  belongs_to(
    :shared_user,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
    )

  belongs_to(
    :contact,
    :primary_key => :id,
    :foreign_key => :contact_id,
    :class_name => "Contact"
    )

end
