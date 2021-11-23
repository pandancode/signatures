class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.text :address
      t.date :start_date
      t.date :end_date
      t.boolean :active, default: true
      t.references :individual, null: false, foreign_key: true

      t.timestamps
    end
  end
end
