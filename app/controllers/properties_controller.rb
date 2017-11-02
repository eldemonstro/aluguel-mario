class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:index, :new, :create]

  def index
    @properties = current_owner.properties
  end

  def new
    @property = Property.new
    @property_types = PropertyType.all
  end

  def create
    @property = Property.new(property_params)
    @property.owner = current_owner
    if @property.save
      flash[:message] = 'Imóvel cadastrado com sucesso'
      redirect_to property_url @property
    else
      @property_types = PropertyType.all
      render :new
    end
  end

  def show; end

  def search_by_type
    # @properties = Property.joins(:property_type).where(property_types: { name: params[:name] })

    @types = PropertyType.where(name: params[:name])
    @properties = Property.where(property_type: @types)
    if @properties.empty?
      flash[:error] = 'Nenhum imóvel encontrado'
      redirect_to request.referer
    else
      render :results
    end
  end

  def search_by_location
    @properties = Property.where(location: params[:location])
    if @properties.empty?
      flash[:error] = 'Nenhum imóvel encontrado'
      redirect_to request.referer
    else
      render :results
    end
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
