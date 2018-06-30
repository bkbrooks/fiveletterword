require 'rails_helper'

RSpec.describe Word, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Game model
  it { should have_many(:games).dependent(:destroy) }
  # Validation tests
  # ensure column word present before saving
  it { should validate_presence_of(:word) }
end
