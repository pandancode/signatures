class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.date :fully_signed_at

      t.timestamps
    end
  end
end
