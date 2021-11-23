class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :address
      t.text :detail

      t.timestamps
    end
  end
end
