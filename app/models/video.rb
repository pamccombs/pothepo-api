class Video < ApplicationRecord
     # model association
  belongs_to :user

  # validation
  validates_presence_of :title, :filepath, 
  :description, :address_1, :address_2, :city, :state, :zip_code
end
