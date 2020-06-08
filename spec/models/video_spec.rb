require 'rails_helper'

RSpec.describe Video, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:filepath) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:address_1) }
  it { should validate_presence_of(:address_2) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip_code) }
end
