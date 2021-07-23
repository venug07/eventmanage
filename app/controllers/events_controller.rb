class EventsController < ApplicationController
    
    before_action :authenticate_request!
    before_action :set_event, only: [:show, :update, :destroy]
    before_action :authorized_actor!, only: [:update, :destroy]

    #GET /events
    #GET /events.json
    def index
    	@events = Event.all
        render json: @events.paginate(page: params[:paginate], per_page: 25)
    end

    # GET /events/1
    # GET /events/1.json
    def show
      if @event	
       render json: @event
      else
       render json: {message: 'Invalid'}, status: :not_found
      end
    end

    # POST /events
    # POST /events.json
    def create
     @event = Event.new(event_params)
     @event.actor = @current_actor
     if @event.save
      render json: @event, status: :created
     else
      render json: @event.errors, status: :unprocessable_entity
     end   
    end


    # GET /repos/1/events
    def get_repo_events
      @repo = Repo.find_by(id: params[:repo_id])
      if @repo
        render json: @repo.events.paginate(page: params[:paginate], per_page: 25)
      else
        render json: {message: 'Invalid'}, status: :not_found
      end
    end

    private

     def set_event
      @event = Event.find(params[:id])
     end

     # Only allow a list of trusted parameters through.
     def event_params
       params.require(:event).permit(:event_type, :repo_id, :public)
     end

    def authorized_actor!
      if @current_actor.id == @event.actor_id
        return true
      else
        render json: {error: 'Unauthorized Action'}, status: :unauthorized
      end  
    end  




end
