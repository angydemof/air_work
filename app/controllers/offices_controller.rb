class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    if params[:query].present?
      @offices = Office.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @offices = Office.all
    end
    @offices.geocoded
    @markers = @offices.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { office: office })
      }
    end
  end

  def show

    @office = Office.find(params[:id])
    @markers =[
      {
        lat: @office.latitude,
        lng: @office.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { office: @office })
      }]
  end
end
