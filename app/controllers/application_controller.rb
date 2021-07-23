class ApplicationController < ActionController::API

  require 'jsonwebtoken'

  protected
  # Validates the token and actor and sets the @current_actor scope
  def authenticate_request!
   if !payload || !JsonWebToken.valid_payload(payload.first)
    return invalid_authentication
   end

   load_current_actor!
   invalid_authentication unless @current_actor
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: {error: 'Invalid Request Authentication Failed'}, status: :unauthorized
  end


  private
  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue
    nil
  end

  # Sets the @current_actor with the actor_id from payload
  def load_current_actor!
    @current_actor = Actor.find_by(id: payload[0]['actor_id'])
  end

end
