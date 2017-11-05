class HomeController < ApplicationController
  def index
    @property_types = PropertyType.all
    @properties = Property.all
    @location_purposes = LocationPurpose.all
  end
end
