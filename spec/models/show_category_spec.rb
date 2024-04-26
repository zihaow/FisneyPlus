RSpec.describe ShowCategory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:show) }
  end
end
