class AssocsController < ApplicationController
  def create
    @assoc = Assoc.new(params[:assoc])

    if @assoc.save
      @serial = find_serial
      redirect_to @serial
    end
  end

  def destroy
    @assoc = Assoc.find(params[:id])

    @assoc.destroy

    redirect_to find_serial
  end

  private
  def find_serial
    Serial.find(@assoc.serial_id)
  end

end
