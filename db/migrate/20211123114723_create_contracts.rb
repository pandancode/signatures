class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.datetime :fully_signed_at, default: nil
      t.string :status, default: "unopened"
      t.references :company, null: false, foreign_key: true
      t.references :individual, null: false, foreign_key: true
      t.string :name, default: "nil"
      t.string :recipient_email, default: "nil"
      t.text :description, default: "nil"

      t.timestamps
    end
  end
end
