class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :song_title
      t.string :year
      t.string :composer
      t.string :key

      t.timestamps
    end
  end
end
