class SerialsController < ApplicationController

  before_filter :find_serial,
    :only => [:show, :edit, :update, :destroy]

  before_filter :find_all_serials,
    :only => [:index, :manage]

  def index
  end

  def show
    if is_signed_in?
      @user = current_user
      @wartosc_options = (1..10).map { |n| [n.to_s, n] }

      @ocena = Ocena.find(:first, :conditions => ["serial_id = :serial_id AND uzytkownik_id = :user_id",
                          { :serial_id => @serial.id, :user_id => @user.id }] )

      # Jesli dostalismy nil z find, to tworzymy nowa ocene
      @ocena ||= Ocena.new :uzytkownik_id => @user.id, :serial_id => @serial.id
    end
  end

  def manage
  end

  def new
    @serial = Serial.new
  end

  def edit
  end

  def create
    @serial = Serial.new(params[:serial])

    if @serial.save
      redirect_to(@serial, :notice => 'Serial was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @serial.update_attributes(params[:serial])
      redirect_to(@serial, :notice => 'Serial was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @serial.destroy

    redirect_to(serials_url)
  end

  private
    def find_serial
      @serial = Serial.find(params[:id])
    end

    def find_all_serials
      @serials = Serial.all
    end
end
