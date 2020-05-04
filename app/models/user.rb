class User < ApplicationRecord
  attribute :is_tutor, :boolean, default: false
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  mount_uploader :profile, ProfileUploader
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
