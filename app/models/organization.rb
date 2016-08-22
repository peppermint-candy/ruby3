class Organization < ActiveRecord::Base

  has_many :members, :dependent =>  :destroy
  has_many :users, :through => :members

  validates :name, :description , presence:true

  validates :name, length: { minimum: 5 }, :uniqueness => true
  validates :description, length: { minimum: 10}

end
