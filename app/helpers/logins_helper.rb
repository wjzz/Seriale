module LoginsHelper
  def current_user
    unless session[:current_user_id].nil?
      Uzytkownik.find(session[:current_user_id])
    end
  end
end
