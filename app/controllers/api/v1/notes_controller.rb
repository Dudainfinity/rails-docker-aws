module Api
  module V1
    class NotesController < ApplicationController
      before_action :set_note, only: %i[show update destroy]

      # GET /api/v1/notes (filter with ?published=true)
      def index
        notes = Note.order(created_at: :desc)
        notes = notes.published if params[:published] == "true"
        render json: NoteSerializer.new(notes).serializable_hash, status: :ok
      end

      # GET /api/v1/notes/:id
      def show
        render json: NoteSerializer.new(@note).serializable_hash, status: :ok
      end

      # POST /api/v1/notes
      def create
        note = Note.new(note_params)
        if note.save
          render json: NoteSerializer.new(note).serializable_hash, status: :created
        else
          render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/notes/:id
      def update
        if @note.update(note_params)
          render json: NoteSerializer.new(@note).serializable_hash, status: :ok
        else
          render json: { errors: @note.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/notes/:id
      def destroy
        @note.destroy
        head :no_content
      end

      private

      def set_note
        @note = Note.find(params[:id])
      end

      def note_params
        params.permit(:title, :body, :published)
      end
    end
  end
end
