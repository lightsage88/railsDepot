Rails.application.routes.draw do
  root 'store#index', as: 'store_index'
=begin The line above starting with as: sets things up so that our
 existing tests will continue to pass because store_controller_test.rb has a testblock
 featuring a get method being called with "get store_index_url" as an argument
 if we do not use the as:'store_index' option then we will not have a 
 store_index_path or store_index_url accessor methods at our disposal
=end 
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
