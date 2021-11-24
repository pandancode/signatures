class CreateIndividuals < ActiveRecord::Migration[6.0]
  def change
    create_table :individuals do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :phone_number
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
