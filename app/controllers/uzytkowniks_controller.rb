class UzytkowniksController < ApplicationController
  before_filter :find_user,
    :only => [:show, :edit, :update, :destroy]

  def index
    @users = Uzytkownik.all
  end

  def show
  end

  def new
    @user = Uzytkownik.new
  end

  def create
    @user = Uzytkownik.new(params[:uzytkownik])

    if @user.save
      flash[:notice] = 'Dodano uzytkownika'
      redirect_to(@user)
    else
      render :action => 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @user.destroy

    redirect_to(uzytkowniks_url)
  end

  private
  def find_user
    @user = Uzytkownik.find(params[:id])
  end
end
