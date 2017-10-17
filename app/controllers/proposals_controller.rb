class ProposalsController < ApplicationController

  before_action :set_property, only: [:show, :new, :create]

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    date_difference = Date.parse(@proposal.end_date) - Date.parse(@proposal.start_date)
    total_amount = @proposal.total_guests * date_difference * @property.daily_rate
    @proposal.total_amount = total_amount
    @proposal.property = @property
    if @proposal.save!
      flash[:message] = 'Proposta enviada com sucesso'
      redirect_to property_proposal_path(@property, @proposal)
    else
    end
  end

  private
  def proposal_params
    params.require(:proposal).permit(:user_name, :email, :start_date,
                                     :end_date, :total_guests, :purpose,
                                     :property_id)
  end

  def set_property
     @property = Property.find(params[:property_id])
  end

end
