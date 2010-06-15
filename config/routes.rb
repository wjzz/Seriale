ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.

  map.help    '/pomoc',       :controller => 'pages',       :action => 'help'
  map.users   '/uzytkownicy', :controller => 'uzytkowniks', :action => 'index'
  map.signup  '/zaloz_konto', :controller => 'uzytkowniks', :action => 'new'
  map.signin  '/zaloguj',     :controller => 'logins',      :action => 'new'
  map.signout '/wyloguj',     :controller => 'logins',      :action => 'destroy'

  map.manage_serials     '/serials/manage',     :controller => 'serials',     :action => 'manage'
  map.manage_aktors      '/aktors/manage',      :controller => 'aktors',      :action => 'manage'
  map.manage_uzytkowniks '/uzytkowniks/manage', :controller => 'uzytkowniks', :action => 'manage'

  map.resources :uzytkowniks
  map.resources :aktors
  map.resources :serials
  map.resources :logins,   :only => [:new, :create, :destroy]
  map.resources :rolas,    :only => [:new, :create, :destroy]
  map.resources :ocenas,   :only => [:create, :update, :destroy]
  map.resources :odcineks, :only => [:show, :create, :destroy, :destroy]

  map.root :controller => 'pages', :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
