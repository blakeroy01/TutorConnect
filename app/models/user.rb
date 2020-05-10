class User < ApplicationRecord
  attr_accessor :conversation_ids
  attribute :is_tutor, :boolean, default: false
  serialize :subject, Array
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.search(search)
    if search
      find(:all, :conditions => ['subject LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def add_request(request_identifier)
  if request_id.include?(request_identifier)
    render 'users/request_overload'
  else
    request_id << request_identifier
    save
  end
end
end
