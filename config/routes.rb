Rails.application.routes.draw do
  # Health check — used by the AWS ALB target group and uptime monitors.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :notes
    end
  end

  root to: ->(_env) {
    [ 200, { "Content-Type" => "application/json" },
     [ { name: "rails-docker-aws", status: "ok" }.to_json ] ]
  }
end
