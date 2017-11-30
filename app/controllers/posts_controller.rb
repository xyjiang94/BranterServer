class PostsController < ApplicationController
	before_action :set_user
	before_action :set_event

	def index
    json_response(Post.all)
  end

	def create
		@event.posts.create!(user_id: @user.id, content: params[:content], image_url: params[:image_url])
		json_response(@event, :created)
	end

	def destroy
    post = Post.find(params[:id])
		post.destroy
    head :no_content
  end

	def get_all_by_user
		res = Post.where(user_id: params[:user_id])
		json_response(res)
	end

	def get_all_by_event
		res = Post.where(event_id: params[:event_id])
		json_response(res)
	end


	private

	def set_user
		@user = User.find_by(id: params[:user_id])
	end

	def set_event
		@event = Event.find_by(id: params[:event_id])
	end

end
