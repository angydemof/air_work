class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_office, except: %i[index new create]
  # before_action :search_params, only: :index

  def index
    @offices = Office.filter_by_location(location)
                     .filter_by_date(start_date, end_date)
                     .filter_by_capacity(capacity)
                     .order(price_cents: price.to_i == 2 ? :desc : :asc)
    @offices.geocoded

    respond_to do |format|
      format.html
      format.js
    end

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
    @markers = [{
                  lat: @office.latitude,
                  lng: @office.longitude,
                  infoWindow: render_to_string(partial: 'info_window', locals: { office: @office }) }]

    @booking = Booking.new
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(set_office_params)
    @office.user = current_user
    schedules = []


    if @office.save
      params[:office][:schedule_ids].each do |schedule|
        OfficeSchedule.create(schedule_id: schedule, office: @office)
      end
      @office.save

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

  def price
    params[:queryPrice]
  end

  def location
    params[:queryLocation]
  end

  def start_date
    params[:queryStartDate]
  end

  def end_date
    params[:queryEndDate]
  end

  def capacity
    params[:queryCapacity]
  end

  def find_office
    @office = Office.find(params[:id])
  end

  def set_office_params
    params.require(:office).permit(:name, :description, :address, :capacity,
                                   :size, :photo, :office_type, :wifi, :coffee_machine,
                                   :smoking_area, :pets_allowed, :printer,
                                   :kitchen, :terrace, :price_cents, :price, :heater_ac, :adaptors, :schedule_ids)
  end
end
