class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.date :fully_signed_at, default: nil
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
