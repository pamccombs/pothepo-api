class VideosController < ApplicationController
    before_action :set_user
    before_action :set_user_video, only: [:show, :update, :destroy]
  
    # GET /users/:user_id/videos
    def index
      json_response(@user.videos)
    end
  
    # GET /users/:user_id/videos/:id
    def show
      json_response(@video)
    end
  
    # POST /users/:user_id/videos
    def create
      @user.videos.create!(video_params)
      json_response(@user, :created)
    end
  
    # PUT /users/:user_id/videos/:id
    def update
      @video.update(video_params)
      head :no_content
    end
  
    # DELETE /users/:user_id/videos/:id
    def destroy
      @video.destroy
      head :no_content
    end
  
    private
  
    def video_params
      params.permit(:title, :filepath, :description, :address_1, :address_2, :city, :state, :zip_code, 
      :suspect_first_name, :suspect_last_name, :suspect_license_plate, :officer_badge_number, :officer_first_name,
      :officer_last_name, :created_by)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_user_video
      @video = @user.videos.find_by!(id: params[:id]) if @user
    end
end
