json.extract! project, :id, :title, :description, :thumbnail, :location, :deadline, :highlights, :results, :created_at, :updated_at
json.url project_url(project, format: :json)
