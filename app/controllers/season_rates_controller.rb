class SeasonRatesController < ApplicationController
  before_action :set_property, only: [:show, :new, :create]

  def show
    @season_rate = SeasonRate.find(params[:id])
  end

  def new
    @season_rate = SeasonRate.new
  end

  def create
    @season_rate = SeasonRate.new(season_rate_params)
    @season_rate.property = @property

    if @season_rate.save
      flash[:message] = 'Temporada enviada com sucesso'
      redirect_to property_season_rate_path(@property, @season_rate)
    else
      render :new
    end
  end

  private

  def season_rate_params
    params.require(:season_rate).permit(:name, :start_date, :end_date,
                                        :daily_rate)
  end

  def set_property
    @property = Property.find(params[:property_id])
  end
end
