class PostsController < ApplicationController
	before_action :set_user
	before_action :set_event

	def index
    json_response(Post.all)
  end

	def create
		@event.posts.create!(user_id: @user.id, content: params[:content])
		json_response(@event, :created)
	end

	def destroy
    post = Post.find(params[:id])
		post.destroy
    head :no_content
  end

	private

	def set_user
		@user = User.find_by(id: params[:user_id])
	end

	def set_event
		@event = Event.find_by(id: params[:event_id])
	end

end
