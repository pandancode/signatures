class AddNamefieldsToContractTable < ActiveRecord::Migration[6.0]
  def change
    add_column :contracts, :title, :string
    add_column :contracts, :first_name, :string
    add_column :contracts, :last_name, :string
  end
end
