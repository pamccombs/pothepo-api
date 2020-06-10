class V2::VideosController < ApplicationController
    def index
        json_response({ message: 'Hello there'})
      end
end
