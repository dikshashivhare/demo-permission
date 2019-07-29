Rails.application.routes.draw do
  get 'home/index'
  get 'home/contact'
  get 'home/about'
  get 'home/privilege'
  get 'home/role_permission_privilage'
  devise_for :users
  root to: "home#index"
  get 'set_access_permissions' => "home#set_access_permissions"
end
