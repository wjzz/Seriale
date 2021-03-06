# -*- coding: utf-8 -*-
class UzytkowniksController < ApplicationController
  before_filter :find_user,
    :only => [:show, :edit, :update, :destroy]

  before_filter :generate_status_options,
    :only => [:edit, :update]

  before_filter :find_all_users,
    :only => [:index, :manage]

  def index
  end

  def show
  end

  def manage
  end

  def new
    @user = Uzytkownik.new
  end

  def create
    @user = Uzytkownik.new(params[:uzytkownik])

    if @user.save
      flash[:notice] = 'Konto utworzono pomyślnie'

      sign_in(@user)
      redirect_to(@user)
    else
      render :action => 'new'
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(params[:uzytkownik])
      flash[:notice] = 'Zmieniono rolę.'
      redirect_to(uzytkowniks_path)
    else
      render :action => "edit"
    end
  end

  def destroy
    @user.listas.each do |lista|
      lista.destroy
    end

    @user.ocenas.each do |ocena|
      ocena.destroy
    end

    @user.destroy

    redirect_to(uzytkowniks_url)
  end

  private
  def find_user
    @user = Uzytkownik.find(params[:id])
  end

  def generate_status_options
    @status_options = [['administrator','a'],['moderator','m'],['standardowy','s']]
  end

  def find_all_users
    @users = Uzytkownik.all
  end
end
