module ControllerSpecHelper
  # generate token from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired token from user id
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers
    {
      "Authorization" => token_generator(user.id),
      "Content-Type" => "application/json"
    }
  end

  # return invalid headers
  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end

  # return invalid headers with wrong token
  def invalid_headers_with_wrong_token
    {
      "Authorization" => token_generator(user.id) + 'wrong',
      "Content-Type" => "application/json"
    }
  end
end
