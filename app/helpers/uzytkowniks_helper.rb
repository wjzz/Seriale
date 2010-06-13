# -*- coding: utf-8 -*-

module UzytkowniksHelper
  def print_status(user)
    if user.rola == 'a'
      'Jesteś administratorem.'
    elsif user.rola == 's'
      'Jesteś standardowym użytkownikiem.'
    else
      'Jestes moderatorem.'
    end
  end
end
