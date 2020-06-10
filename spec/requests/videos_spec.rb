require 'rails_helper'

RSpec.describe 'Videos API', type: :request do
  # add videos owner
  let(:user) { create(:user) } 
  let!(:videos) { create_list(:video, 10, created_by: user.id) }
  let(:video_id) { videos.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /videos' do
    # update request with headers
    before { get '/videos', params: {}, headers: headers }

    it 'returns videos' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /videos/:id' do
    before { get "/videos/#{video_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the video' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(video_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:video_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Video with 'id'=#{video_id}/)
      end
    end
  end

  describe 'POST /videos' do
     let(:valid_attributes) do
      # send json payload
      { title: 'Learn Elm', 
      filepath: 'user/video',
      description: 'Video By User',
      address_1:'123 John Doe Ln.',
      address_2:'#1A',
      city:'Brooklyn',
      state:'NY',
      zip_code:'11238',
      created_by: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/videos', params: valid_attributes, headers: headers }

      it 'creates a video' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'has a created by that equals user id' do
        expect(json['created_by']).to eq("#{user.id}")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/videos', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /videos/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/videos/#{video_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /videos/:id' do
    before { delete "/videos/#{video_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end