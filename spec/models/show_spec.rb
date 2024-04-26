RSpec.describe Show, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:show_categories) }
    it { is_expected.to have_many(:categories).through(:show_categories) }

    it { is_expected.to have_many(:favorites) }
    it { is_expected.to have_many(:users).through(:favorites) }
  end
end
