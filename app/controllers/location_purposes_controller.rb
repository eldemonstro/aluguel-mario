class LocationPurposesController < ApplicationController
  def index
    @location_purpose = LocationPurpose.find(params[:id])
    @properties = @location_purpose.properties
  end
end
