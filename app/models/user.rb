class User < ApplicationRecord

    # encrypt password
    has_secure_password
     # model association
  has_many :videos, foreign_key: :created_by

  # validations
  validates_presence_of :username, :email, :password_digest, :first_name, :last_name
end
