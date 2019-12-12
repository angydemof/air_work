class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @offices = Office.all.first(10)
  end
end
