# -*- coding: utf-8 -*-
class LoginsController < ApplicationController
  def new
  end

  def create
    user = Uzytkownik.authenticate(params[:login][:nazwa], params[:login][:password])

    if user.nil?
      flash.now[:error] = "Niepoprawna nazwa użytkownika/hasło!"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
