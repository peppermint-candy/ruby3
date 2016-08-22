class User < ActiveRecord::Base
  has_secure_password

  has_many :members
  has_many :organizations , :through => :members
  #
  # has_and_belongs_to_many :members,
  #   :class_name => "User",
  #   :join_table => "organizations",
  #   :association_foreign_key => "member_id"

  # has_and_belongs_to_many :members_of,
  #   :class_name => "User",
  #   :join_table => "organizations",
  #   :foreign_key => "member_id",
  #   :association_foreign_key => "user_id"

  validates :first_name, :last_name , :password , presence:true

  validates :password, length: { minimum: 8 }

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true
end
