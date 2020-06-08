require 'rails_helper'

# # Test suite for the Video model
# RSpec.describe Video, type: :model do
#   # Association test
#   # ensure Video model has a 1:m relationship with the Item model
#   it { should have_many(:videos).dependent(:destroy) }
#   # Validation tests
#   # ensure columns title and created_by are present before saving
#   it { should validate_presence_of(:title) }
#   it { should validate_presence_of(:created_by) }
# end

RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Video model
  it { should have_many(:videos) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end
