# frozen_string_literal: true

class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params) # Assuming you have a list_params method for strong parameters
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end


  private

  def list_params
    params.require(:list).permit(:name)
  end
end
