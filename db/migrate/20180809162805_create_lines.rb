class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :season
      t.string :episode
      t.string :character
      t.string :line

      t.timestamps
    end
  end
end
