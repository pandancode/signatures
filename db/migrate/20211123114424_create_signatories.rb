class CreateSignatories < ActiveRecord::Migration[6.0]
  def change
    create_table :signatories do |t|
      t.boolean :signing_status, default: false
      t.references :contract, null: false, foreign_key: true
      t.references :individual, null: false, foreign_key: true

      t.timestamps
    end
  end
end
