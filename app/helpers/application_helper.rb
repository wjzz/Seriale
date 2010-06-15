# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def can_edit?(resourse_name)
    # nalezy to napisac lepiej

    unless current_user.nil?
      if resourse_name == :uzytkowniks
        return current_user.admin?
      end

      return !current_user.standard?
    end
  end

  def is_signed_in?
    return !current_user.nil?
  end

end
