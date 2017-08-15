class AddUniqueContraintToRatings < ActiveRecord::Migration[5.1]
  def change
    add_index :ratings, [:user_id, :movie_id], unique: true
  end
end
