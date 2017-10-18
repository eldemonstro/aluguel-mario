class AddStatusToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :status, :string, default: 'waiting'
  end
end
