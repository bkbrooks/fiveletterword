require 'rails_helper'

RSpec.describe Game, type: :model do
  # Association test
  # ensure an item record belongs to a single word record
  it { should belong_to(:word) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:guesses) }
end
