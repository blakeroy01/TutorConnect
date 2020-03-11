class User < ApplicationRecord
  attr_accessor :bio, :is_tutor
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
end
