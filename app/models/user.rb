class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  has_many :urls
end
