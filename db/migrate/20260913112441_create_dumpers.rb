class CreateDumpers < ActiveRecord::Migration[8.1]
  def change
    create_table :dumpers do |t|
      t.string :make
      t.string :model
      t.string :slno
      t.string :location
      t.string :fl
      t.string :fr
      t.string :rri
      t.string :rro
      t.string :rli
      t.string :rlo
      t.string :fatigue

      t.timestamps
    end
  end
end
