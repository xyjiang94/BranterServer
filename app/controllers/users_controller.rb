class UsersController < ApplicationController
	before_action :set_User, only: [:show, :update, :destroy]

	# GET /Users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /Users
  def create
    @User = User.create!(user_params)
    json_response(@User, :created)
  end

  # GET /Users/:id
  def show
    json_response(@User)
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
    params.permit(:name, :gender, :birthday)
  end


	def set_User
		@User = User.find(params[:id])
	end
end
