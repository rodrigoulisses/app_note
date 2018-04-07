require 'rails_helper'

RSpec.describe User do
  context 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  context 'relationship' do
    it { is_expected.to have_and_belong_to_many(:notes) }
  end

end
