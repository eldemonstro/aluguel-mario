class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def new
    @property = Property.new
    @property_types = PropertyType.all
  end

  def create
    property = Property.new(property_params)
    if property.save
      flash[:message] = 'Imóvel cadastrado com sucesso'
      redirect_to property_url property
    else

    end
  end

  def show

  end

  private

  def set_property
     @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :location, :property_type_id,
                                     :area, :description, :daily_rate, :rooms,
                                     :minimum_rent_days, :maximum_rent_days,
                                     :maximum_occupancy, :usage_rules,
                                     :photo)

  end

end
