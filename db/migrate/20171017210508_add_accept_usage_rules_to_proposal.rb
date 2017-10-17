class AddAcceptUsageRulesToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :accept_usage_rules, :boolean
  end
end
