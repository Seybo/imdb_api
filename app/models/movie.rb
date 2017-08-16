# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rating     :float
#
# Indexes
#
#  index_movies_on_title  (title)
#

class Movie < ApplicationRecord
  has_many :ratings

  validates :title, presence: true, uniqueness: true
end
