class HomeController < ApplicationController
  def index
    @property_types = PropertyType.all 
  end
end
