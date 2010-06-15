class OcenasController < ApplicationController
  before_filter :find_ocena,
    :only => [:update, :destroy]

  def index
    @user = Uzytkownik.find(params[:id])

    @oceny = @user.ocenas
  end

  def create
    @ocena = Ocena.new(params[:ocena])

    @ocena.save

    redirect_to Serial.find(@ocena.serial_id)
  end

  def update
    @ocena.update_attributes(params[:ocena])

    redirect_to Serial.find(@ocena.serial_id)
  end

  def destroy
    @ocena.destroy

    redirect_to :action => :index, :id => @ocena.uzytkownik_id
  end

  private
  def find_ocena
    @ocena = Ocena.find(params[:id])
  end
end
