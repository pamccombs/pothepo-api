class VideoSerializer < ActiveModel::Serializer
   # attributes to be serialized  
   attributes :id, :title, :filepath, :description, :address_1, :address_2, :city, :state, :zip_code, 
   :suspect_first_name, :suspect_last_name, :suspect_license_plate, :officer_badge_number, :officer_first_name,
   :officer_last_name, :created_by, :created_at, :updated_at
   # model association
   belongs_to :user, optional: true
end
