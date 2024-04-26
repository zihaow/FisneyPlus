RSpec.describe 'Users API', type: :request do
  describe 'POST /login' do
    let(:user) { create(:user, password: 'Test123') }
    let(:params) { { email: user.email, password: 'Test123' } }

    context 'user logins successfully' do
      before { post "/login", params: params }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end