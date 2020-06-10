module V1
  class VideosController < ApplicationController
    before_action :set_video, only: [:show, :update, :destroy]

    # GET /videos
    def index
      # get current user videos
      @videos = Video.all
      json_response(@videos)
    end

    # GET /videos/:id
    def show
      json_response(@video)
    end

    # POST /videos
    def create
      # create videos belonging to current user
      @video = current_user.videos.create!(video_params)
      json_response(@video, :created)
    end

    # PUT /videos/:id
    def update
      @video.update(video_params)
      head :no_content
    end

    # DELETE /videos/:id
    def destroy
      @video.destroy
      head :no_content
    end

    private

    # remove `created_by` from list of permitted parameters
    def video_params
      params.permit(:title, :filepath, :description, :address_1, :address_2, :city, :state, :zip_code, 
      :suspect_first_name, :suspect_last_name, :suspect_license_plate, :officer_badge_number, :officer_first_name,
      :officer_last_name
      )
    end

    def set_video
      @video = Video.find(params[:id])
    end
  end
end
