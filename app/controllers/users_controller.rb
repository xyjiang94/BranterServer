class UsersController < ApplicationController
	before_action :set_User, only: [:show, :update, :destroy]

	# GET /Users
  def index
    @users = User.all
    json_response_user(@users)
  end

  # POST /Users
  def create
    @User = User.create!(user_params)
    json_response_user(@User, :created)
  end

	def login
		user = User.find_by(email: params[:email])
		puts user
		puts 'fffffffffffuck'
		result = user.authenticate(params[:password])
		response = {"success_flag" => !!result, "user" => result}
		json_response(response)
	end

  # GET /Users/:id
  def show
    json_response_user(@User)
		puts @User.num_post,@User.num_events_host, @User.num_event_joined
  end

  # PUT /Users/:id
  def update
    @User.update(user_params)
    head :no_content
  end

  # DELETE /Users/:id
  def destroy
    @User.destroy
    head :no_content
  end

  private

	def user_params
    # whitelist params
    params.permit(:name, :gender, :birthday, :email, :password, :password_confirmation)
  end


	def set_User
		@User = User.find(params[:id])
		begin
			@User.num_events_host = @User.events.all.count
		rescue
			@User.num_events_host = 0
		end

		begin
			@User.num_event_joined = EventFollower.find_by(follower_id: @User.id).size
		rescue
			@User.num_event_joined = 0
		end

		begin
			@User.num_post = Post.find_by(user_id: @User.id).size
		rescue
			@User.num_post = 0
		end

		puts @User.num_post,@User.num_events_host,@User.num_event_joined
	end


	def json_response_user(object, status = :ok)
		render json: @User.as_json(methods: [:num_post, :num_events_host, :num_event_joined]), status: status
	end

end
