require 'rails_helper'

RSpec.describe 'Api::V1::Notes', type: :request do
  describe 'GET /api/v1/notes' do
    it 'lists notes' do
      create_list(:note, 3)
      get '/api/v1/notes'
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['data'].size).to eq(3)
    end

    it 'filters published notes' do
      create(:note, :published)
      create(:note)
      get '/api/v1/notes', params: { published: 'true' }
      expect(response.parsed_body['data'].size).to eq(1)
    end
  end

  describe 'GET /api/v1/notes/:id' do
    it 'returns a note' do
      note = create(:note)
      get "/api/v1/notes/#{note.id}"
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.dig('data', 'attributes', 'title')).to eq(note.title)
    end

    it 'returns 404 for a missing note' do
      get '/api/v1/notes/0'
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /api/v1/notes' do
    it 'creates a note' do
      expect do
        post '/api/v1/notes', params: { title: 'Hello', body: 'World' }
      end.to change(Note, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it 'returns errors for invalid data' do
      post '/api/v1/notes', params: { title: '' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.parsed_body['errors']).to be_present
    end
  end

  describe 'PATCH /api/v1/notes/:id' do
    it 'updates a note' do
      note = create(:note)
      patch "/api/v1/notes/#{note.id}", params: { published: true }
      expect(response).to have_http_status(:ok)
      expect(note.reload).to be_published
    end

    it 'returns errors with invalid data' do
      note = create(:note)
      patch "/api/v1/notes/#{note.id}", params: { title: '' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /api/v1/notes/:id' do
    it 'deletes a note' do
      note = create(:note)
      expect do
        delete "/api/v1/notes/#{note.id}"
      end.to change(Note, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'GET /up' do
    it 'returns 200 for the health check' do
      get '/up'
      expect(response).to have_http_status(:ok)
    end
  end
end
