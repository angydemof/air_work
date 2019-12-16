class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_office, except: %i[index new]

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
    @markers = [
      {
        lat: @office.latitude,
        lng: @office.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { office: @office })
      }]

    @booking = Booking.new
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(set_office_params)
    @office.user = current_user

    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @office.update(set_office_params)
    if @office.save
      redirect_to office_path(@office)
    else
      render :edit
    end
  end

  def destroy
    @office.destroy
    redirect_to dashboards_path
  end

  private

  def find_office
    @office = current_user.offices.find(params[:id])
  end

  def set_office_params
    params.require(:office).permit(:name, :description, :address, :capacity,
                                   :size, :photo, :type, :wifi, :coffee_machine,
                                   :smoking_area, :pets_allowed, :printer,
                                   :kitchen, :terrace, :price_cents)
  end
end
