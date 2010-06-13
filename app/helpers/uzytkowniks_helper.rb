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

  def status(user)
    if user.rola == 'a'
      'administrator'
    elsif user.rola == 'm'
      'moderator'
    else
      'standardowy'
    end
  end
end
