# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_movies_on_title  (title)
#

FactoryGirl.define do
  factory :movie do
    title { Faker::Movie.quote }
    rating 1
  end
end
