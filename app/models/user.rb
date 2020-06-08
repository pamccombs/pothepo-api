class User < ApplicationRecord
     # model association
  has_many :videos, dependent: :destroy

  # validations
  validates_presence_of :username, :email, :password_digest, :first_name, :last_name
end
