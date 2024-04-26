module AuthHelpers
  def sign_in(user)
    payload = { user_id: user.id }
    token = JWT.encode(payload, ENV['SECRET_KEY'])
    { 'Authorization': "Bearer #{token}" }
  end
end
