RSpec.describe Category, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:show_categories) }
    it { is_expected.to have_many(:shows).through(:show_categories) }
  end
end
