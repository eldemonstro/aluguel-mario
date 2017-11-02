class UnavailableDatesController < ApplicationController

  before_action :set_property, only: [:show, :new, :create]
  before_action :authenticate_owner!

  def show
    @unavailable_date = UnavailableDate.find(params[:id])
  end

  def new
    @unavailable_date = UnavailableDate.new
  end

  def create
    @unavailable_date = UnavailableDate.new(unavailable_date_params)
    @unavailable_date.property = @property

    if @unavailable_date.save
      flash[:message] = 'Período Indisponínel cadastrado com sucesso'
      redirect_to [@property, @unavailable_date]
    else
      render :new
    end
  end

  private
  def set_property
    @property = Property.find(params[:property_id])
  end

  def unavailable_date_params
    params.require(:unavailable_date).permit(:name, :start_date, :end_date)
  end
end
