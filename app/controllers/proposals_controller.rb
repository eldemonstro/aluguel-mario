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
    @proposal.property = @property
    @proposal.total_amount_calculator
    if @proposal.save
      flash[:message] = 'Proposta enviada com sucesso'
      redirect_to property_proposal_path(@property, @proposal)
    else
      render :new
    end
  end

  def accept
    proposal = Proposal.find(params[:id])
    proposal.accept

    redirect_to request.referer
  end

  private
  def proposal_params
    params.require(:proposal).permit(:user_name, :email, :start_date,
                                     :end_date, :total_guests, :purpose,
                                     :property_id, :accept_usage_rules)
  end

  def set_property
     @property = Property.find(params[:property_id])
  end

end
