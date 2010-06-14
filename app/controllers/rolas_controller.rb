class RolasController < ApplicationController
  before_filter :generate_options,
    :only => [:new, :new_with_aktor, :new_with_serial, :create]

  def new
    @rola = Rola.new
  end

  def new_with_aktor
    @aktor = Aktor.find(params[:id])

    @rola = Rola.new(:aktor_id => @aktor.id)

    render :action => "new"
  end

  def new_with_serial
    @serial = Serial.find(params[:id])

    @rola = Rola.new(:serial_id => @serial.id)

    render :action => "new"
  end

  def create
    @rola = Rola.new(params[:rola])

    if @rola.save
      @aktor  = Aktor.find(@rola.aktor_id)
      @serial = Serial.find(@rola.serial_id)
    else
      render :action => 'new'
    end
  end

  def destroy
  end

  private
  def generate_options
    @seriale_options = Serial.all.map { |s| [s.nazwa, s.id] }
    @aktorzy_options = Aktor.all.map { |a| ["#{a.imie} #{a.nazwisko}", a.id] }
  end
end
