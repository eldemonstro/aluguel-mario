class ChangeStatusToEnumInProposal < ActiveRecord::Migration[5.1]
  def change
    change_column :proposals, :status, :integer, default: 0
  end
end
