class EventFollowersController < ApplicationController
	before_action :set_up, only: [:create, :update, :destroy]

	def index
    json_response(EventFollower.all)
  end

	def create
    # EventFollower.create!(event_id: @event.id, user_id: @user.id) if @event && @user

		@event.event_followers.create!(follower_id: @user.id)
		json_response(@user, :created)
  end

	def update
    EventFollower.update(event_id: @event.id, user_id: @user.id) if @event && @user
    head :no_content
  end

	def destroy
    relation = EventFollower.find_by(event_id: @event.id, user_id: @user.id)
		relation.destroy
    head :no_content
  end

	def get_followers
		# @event = Event.find(params[:event_id])
		# puts @event.id
		# puts "FUCKKKKKKK"
		# users = User.joins(:event_followers).where(event_followers: {event_id: @event.id})
		# print users
		# return users

		followRelations = EventFollower.where(event_id: params[:event_id])
		results = []

		followRelations.each do |x|
			results << User.find_by(id: x.follower_id)
		end

		json_response(results)
	end


	def get_joined_events

		followRelations = EventFollower.where(follower_id: params[:user_id])
		results = []

		followRelations.each do |x|
			results << Event.find_by(id: x.event_id)
		end

		json_response(results)
	end

	private

	def set_up
		@user = User.find(params[:user_id])
		@event = Event.find(params[:event_id])
	end
end
