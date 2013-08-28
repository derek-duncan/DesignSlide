Index::Application.routes.draw do
  root :to => "pages/home_index#index"
	scope :pages do
	  resources :home_index
	end
	match "admin" => "admin/dashboard#index"
	namespace :admin do
		root :to => "admin/dashboard#index"
		resources :dashboard
		resources :posts do
			put :updatePost, :on => :collection
		 resources :attachments
		end
	end
	resources :posts, :comments
end
