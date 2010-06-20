class ListasController < ApplicationController
  before_filter :generate_options,
    :only => [ :new, :create, :edit, :update]

  before_filter :find_lista,
    :only => [:show, :edit, :update, :destroy]

  before_filter :find_user,
    :only => [:new, :show_for_user]

  def index
    @public_listas = Lista.all.select { |l| l.dostep == "o" }
  end

  def show
  end

  def show_for_user
  end

  def new
    @lista = Lista.new(:uzytkownik_id => @user.id)
  end

  def edit
  end

  def create
    @lista = Lista.new(params[:lista])

    if @lista.save
        redirect_to(:action => :show_for_user, :id => @lista.uzytkownik_id)
    else
      render :action => "new"
    end
  end

  def update
    if @lista.update_attributes(params[:lista])
      redirect_to(@lista)
    else
      render :action => "edit"
    end
  end

  def destroy
    @lista.assocs.each do |assoc|
      assoc.destroy
    end

    @lista.destroy

    redirect_to :action => :show_for_user, :id => @lista.uzytkownik_id
  end

  private
  def generate_options
    @dostep_options = [['Lista prywatna', 'p'], ['Lista publiczna', 'o']]
  end

  def find_lista
    @lista = Lista.find(params[:id])
  end

  def find_user
    @user = Uzytkownik.find(params[:id])
  end
end
