class OcenasController < ApplicationController
  def create
    @ocena = Ocena.new(params[:ocena])

    @ocena.save

    redirect_to Serial.find(@ocena.serial_id)
  end

  def update
    @ocena = Ocena.find(params[:id])

    @ocena.update_attributes(params[:ocena])

    redirect_to Serial.find(@ocena.serial_id)
  end
end
