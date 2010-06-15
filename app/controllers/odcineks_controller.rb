class OdcineksController < ApplicationController
  before_filter :find_serial,
    :only => [:new, :show_for_serial, :edit_for_serial]

  before_filter :find_odcinek,
    :only => [:destroy, :edit, :update]

  before_filter :generate_options,
    :only => [:new, :create, :edit, :update]

  def index
  end

  def new
    @odcinek = Odcinek.new(:serial_id => @serial.id)
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
    if @odcinek.update_attributes(params[:odcinek])
      redirect_to :action => :edit_for_serial, :id => @odcinek.serial_id
    else
      render 'edit'
    end
  end

  def destroy

    @odcinek.destroy

    redirect_to :action => :edit_for_serial, :id => @odcinek.serial_id
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

  def find_odcinek
    @odcinek = Odcinek.find(params[:id])
  end

  def generate_options
    @numer_options = (0..100).map { |n| [n.to_s, n] }
    @sezon_options = (1..20).map  { |n| [n.to_s, n] }
    @czas_options  = (1..180).map { |n| [n.to_s, n] }
  end
end
