class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating

      t.timestamps
    end
    add_index :movies, :title
  end
end
