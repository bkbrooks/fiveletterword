require 'rails_helper'

RSpec.describe Guess, type: :model do
  # Association test
  # ensure an item record belongs to a single word record
  it { should belong_to(:game) }
end
