class V1::ProfilesController < V1::ApplicationController
  def show
    json_response({ email: @current_user.email }, :ok)
  end
end
