class ChangeRatingColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :movies, :rating, :float
  end
end
