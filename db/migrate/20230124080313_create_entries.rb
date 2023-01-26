class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :song_title
      t.string :year
      t.string :composer
      t.string :key
      t.string :video_url
      t.boolean :learning, default: false

      t.timestamps
    end
  end
end
