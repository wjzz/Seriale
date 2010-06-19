class OdcineksController < ApplicationController
  before_filter :find_serial,
    :only => [:new, :show_for_serial, :edit_for_serial]

  before_filter :find_odcinek,
    :only => [:destroy, :edit, :update]

  before_filter :generate_options,
    :only => [:new, :create, :new_batch, :create_batch, :edit, :update]

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

  def new_batch
    @serial_id = params[:id]
    @odcinek = Odcinek.new

    @odstep_options = (1..31).map { |n| [n.to_s, n] }
  end

  def create_batch
    @odcinek_data = Odcinek.new(params[:odcinek])

    pierwszy = params[:pierwszy].to_i
    ostatni  = params[:ostatni].to_i
    odstep   = params[:odstep]
    sezon    = params[:sezon]
    serial_id = params[:serial_id]
    data_emisji  = @odcinek_data.data_emisji
    czas_trwania = @odcinek_data.czas_trwania
    tytuly       = params[:tytuly].split(/\r?\n/)
    (pierwszy..ostatni).each do |numer|

      Odcinek.create(
        :serial_id => serial_id,
        :czas_trwania => czas_trwania,
        :sezon => sezon,
        :numer => numer,
        :data_emisji => data_emisji,
        :tytul => tytuly[numer - pierwszy]
      )
      data_emisji = odstep.to_i.days.since(data_emisji)
    end

    redirect_to :action => :edit_for_serial, :id => serial_id
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
    @sezony = @serial.odcineks.map { |odcinek| odcinek.sezon }.uniq.sort

    @odcinki = @serial.odcineks.group_by(&:sezon)
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
