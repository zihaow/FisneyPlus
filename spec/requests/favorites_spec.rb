RSpec.describe 'Favorites API', type: :request do
  describe 'POST /favorites' do
    let!(:user) { create(:user) }
    let(:show) { create(:show) }
    let!(:show2) { create(:show) }
    let!(:favorite) { create(:favorite, user: user, show: show2) }
    let(:params) { { show: { id: show.id } } }
    let(:invalid_params) { { show: { id: show2.id } } }

    context 'user favors a movie or TV show' do
      before { post "/favorites", params: params, headers: sign_in(user) }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'user cannot favors a movie or TV show that is already favorited' do
      before { post "/favorites", params: invalid_params, headers: sign_in(user) }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end
end