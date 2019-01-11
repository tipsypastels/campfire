Rails.application.routes.draw do
  root 'campfire#index'
  mount ActionCable.server => '/cable'
end
