require 'rails_helper'

# RSpec.describe 'Videos API' do
#     # Initialize the test data
#     let!(:user) { create(:user) }
#     let!(:videos) { create_list(:video, 20, user_id: user.id) }
#     let(:user_id) { user.id }
#     let(:id) { videos.first.id }
  
#     # Test suite for GET /users/:user_id/videos
#     describe 'GET /users/:user_id/videos' do
#       before { get "/users/#{user_id}/videos" }
  
#       context 'when user exists' do
#         it 'returns status code 200' do
#           expect(response).to have_http_status(200)
#         end
  
#         it 'returns all user videos' do
#           expect(json.size).to eq(20)
#         end
#       end
  
#       context 'when user does not exist' do
#         let(:user_id) { 0 }
  
#         it 'returns status code 404' do
#           expect(response).to have_http_status(404)
#         end
  
#         it 'returns a not found message' do
#           expect(response.body).to match(/Couldn't find user/)
#         end
#       end
#     end
  
#     # Test suite for GET /users/:user_id/videos/:id
#     describe 'GET /users/:user_id/videos/:id' do
#       before { get "/users/#{user_id}/videos/#{id}" }
  
#       context 'when user video exists' do
#         it 'returns status code 200' do
#           expect(response).to have_http_status(200)
#         end
  
#         it 'returns the video' do
#           expect(json['id']).to eq(id)
#         end
#       end
  
#       context 'when user video does not exist' do
#         let(:id) { 0 }
  
#         it 'returns status code 404' do
#           expect(response).to have_http_status(404)
#         end
  
#         it 'returns a not found message' do
#           expect(response.body).to match(/Couldn't find video/)
#         end
#       end
#     end
  
#     # Test suite for PUT /users/:user_id/videos
#     describe 'POST /users/:user_id/videos' do
#       let(:valid_attributes) { { name: 'Visit Narnia', done: false } }
  
#       context 'when request attributes are valid' do
#         before { post "/users/#{user_id}/videos", params: valid_attributes }
  
#         it 'returns status code 201' do
#           expect(response).to have_http_status(201)
#         end
#       end
  
#       context 'when an invalid request' do
#         before { post "/users/#{user_id}/videos", params: {} }
  
#         it 'returns status code 422' do
#           expect(response).to have_http_status(422)
#         end
  
#         it 'returns a failure message' do
#           expect(response.body).to match(/Validation failed: Name can't be blank/)
#         end
#       end
#     end
  
#     # Test suite for PUT /users/:user_id/videos/:id
#     describe 'PUT /users/:user_id/videos/:id' do
#       let(:valid_attributes) { { name: 'Mozart' } }
  
#       before { put "/users/#{user_id}/videos/#{id}", params: valid_attributes }
  
#       context 'when video exists' do
#         it 'returns status code 204' do
#           expect(response).to have_http_status(204)
#         end
  
#         it 'updates the video' do
#           updated_video = video.find(id)
#           expect(updated_video.name).to match(/Mozart/)
#         end
#       end
  
#       context 'when the video does not exist' do
#         let(:id) { 0 }
  
#         it 'returns status code 404' do
#           expect(response).to have_http_status(404)
#         end
  
#         it 'returns a not found message' do
#           expect(response.body).to match(/Couldn't find video/)
#         end
#       end
#     end
  
#     # Test suite for DELETE /users/:id
#     describe 'DELETE /users/:id' do
#       before { delete "/users/#{user_id}/videos/#{id}" }
  
#       it 'returns status code 204' do
#         expect(response).to have_http_status(204)
#       end
#     end
# end