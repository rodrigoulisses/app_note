require 'rails_helper'

RSpec.describe Note do
  context 'validate' do
    it { is_expected.to validate_presence_of(:body) }
  end

  context 'relationship' do
    it { is_expected.to have_and_belong_to_many(:users) }
  end
end
