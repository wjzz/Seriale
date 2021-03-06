# -*- coding: utf-8 -*-
class AktorsController < ApplicationController
  before_filter :generate_gender_options,
    :only => [:new, :edit]

  before_filter :find_aktor,
    :only => [:show, :edit, :update, :destroy]

  before_filter :find_all_aktors,
    :only => [:index, :manage]

  def index
  end

  def show
  end

  def manage
  end

  def new
    @aktor = Aktor.new
  end

  def edit
  end

  def create
    @aktor = Aktor.new(params[:aktor])

    if @aktor.save
      redirect_to(@aktor, :notice => 'Aktor was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @aktor.update_attributes(params[:aktor])
      redirect_to(@aktor, :notice => 'Aktor was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @aktor.rolas.each do |rola|
      rola.destroy
    end

    @aktor.destroy

    redirect_to(aktors_url)
  end

  private
  def generate_gender_options
    @gender_options = [["Kobieta","k"], ["Mężczyzna","m"]]
  end

  def find_aktor
    @aktor = Aktor.find(params[:id])
  end

  def find_all_aktors
    @aktors = Aktor.all
  end
end
