class User < ApplicationRecord
  attr_accessor :bio
  has_one :bio
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def initialize(attributes={})
  super
  @bio ||= "Enter a bio"
end
end
