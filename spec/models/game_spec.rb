require 'rails_helper'

RSpec.describe Game, type: :model do
  # Association test
  # ensure an item record belongs to a single word record
  it { should belong_to(:word) }
  it { should have_many(:guesses) }
end
