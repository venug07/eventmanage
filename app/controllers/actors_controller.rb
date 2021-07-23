class ActorsController < ApplicationController

   # POST /actors
   def create
     @actor = Actor.new(actor_params)
     if @actor.save
      render json: {status: 'Actor created successfully'}, status: :created
     else
      render json: { errors: @actor.errors.full_messages }, status: :bad_request
     end
   end

   #POST /actors/login
   def login
    @actor = Actor.find_by(email: params[:email].to_s.downcase)

    if @actor && @actor.authenticate(params[:password])
      auth_token = JsonWebToken.encode({actor_id: @actor.id})
      render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
   end

   private

   def actor_params
    params.require(:actor).permit(:name, :email, :password, :password_confirmation)
   end

end
