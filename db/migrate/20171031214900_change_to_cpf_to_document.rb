class ChangeToCpfToDocument < ActiveRecord::Migration[5.1]
  def change
    rename_column :owners, :cpf, :document
  end
end
