class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    if params[:query].present?
      @offices = Office.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @offices = Office.all
    end
  end

  def show
    @office = Office.find(params[:id])
  end
end
