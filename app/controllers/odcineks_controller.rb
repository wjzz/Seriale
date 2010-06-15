class OdcineksController < ApplicationController
  before_filter :find_serial,
    :only => [:new, :show_for_serial, :edit_for_serial]

  def index
  end

  def new
    @odcinek = Odcinek.new(:serial_id => @serial.id)

    @numer_options = (0..100).map { |n| [n.to_s, n] }
    @sezon_options = (1..20).map  { |n| [n.to_s, n] }
    @czas_options  = (1..180).map { |n| [n.to_s, n] }
  end

  def create
    @odcinek = Odcinek.new(params[:odcinek])

    if @odcinek.save
      redirect_to :action => :edit_for_serial, :id => @odcinek.serial_id
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def show_for_serial

  end

  def edit_for_serial

  end

  private
  def find_serial
    @serial = Serial.find(params[:id])
  end
end
