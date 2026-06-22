class NoteSerializer
  include JSONAPI::Serializer

  attributes :title, :body, :published, :created_at, :updated_at
end
