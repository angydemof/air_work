class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @offices = Office.all
  end

  def show
  end
end
