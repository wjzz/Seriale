ActionController::Routing::Routes.draw do |map|
  map.resources :serials

  # The priority is based upon order of creation: first created -> highest priority.

  map.help    '/pomoc',       :controller => 'pages',       :action => 'help'
  map.users   '/uzytkownicy', :controller => 'uzytkowniks', :action => 'index'
  map.signup  '/zaloz_konto', :controller => 'uzytkowniks', :action => 'new'
  map.signin  '/zaloguj',     :controller => 'logins',      :action => 'new'
  map.signoff '/wyloguj',     :controller => 'logins',      :action => 'destroy'

  map.resources :uzytkowniks
  map.resources :logins, :only => [:new, :create, :destroy]

  map.root :controller => 'pages', :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
