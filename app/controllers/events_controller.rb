class EventsController < ApplicationController
	before_action :set_user
	before_action :set_event, only: [:show, :update, :destroy]

	# GET /users/:user_id/events
  def index
    json_response_event_list(Event.all)
  end

  # GET /users/:user_id/events/:id
  def show
    json_response_event(@event)
  end

  # POST /users/:user_id/events
  def create
    event = @user.events.create!(event_params)
		event.event_followers.create!(follower_id: @user.id)
    json_response_event(event, :created)
  end

  # PUT /users/:user_id/events/:id
  def update
    @event.update(event_params)
    head :no_content
  end

  # DELETE /users/:user_id/events/:id
  def destroy
    @event.destroy
    head :no_content
  end


  private

	def event_params
    # whitelist params
    params.permit(:title, :from, :to, :lat, :lng, :contents, :image_url)
  end

	def set_user
		@user = User.find_by(id: params[:user_id])
	end

	def set_event
		if @user
			@event = @user.events.find_by(id: params[:id])
		else
			@event = Event.find_by(id: params[:id])
		end


		begin
			@event.num_follower = EventFollower.find_by(event_id: @User.id).size
		rescue
			@event.num_follower = 0
		end

	end

	def json_response_event(object, status = :ok)
		render json: @event.to_json({:include => :user, :methods => :num_follower}), status: status
	end

	def json_response_event_list(res)
		list = []
		res.each do |x|
			list << x.to_json({:include => :user, :methods => :num_follower})
		end
		json_response(list)
	end

end
