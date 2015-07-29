class User < ActiveRecord::Base
  include BCrypt

  has_many :likes
  has_many :items, through: :likes
  has_many :comments

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
