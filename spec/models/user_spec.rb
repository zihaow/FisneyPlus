RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:favorites) }
    it { is_expected.to have_many(:shows).through(:favorites) }
  end
end
