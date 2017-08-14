class V1::UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  def create
    User.create!(user_params)
    response = { message: Message.account_created }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
