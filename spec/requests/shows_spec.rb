RSpec.describe 'Shows API', type: :request do
  describe 'GET /shows/id' do
    let(:user) { create(:user) }
    let(:show) { create(:show) }

    context 'get a show by id' do
      before { get "/shows/#{show.id}", headers: sign_in(user) }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end