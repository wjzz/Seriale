# -*- coding: utf-8 -*-

module AktorsHelper
  def show_gender(aktor)
    unless aktor.nil?
      if aktor.plec == 'm'
        "Mężczyzna"
      else
        "Kobieta"
      end
    end
  end
end
