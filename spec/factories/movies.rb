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

FactoryGirl.define do
  factory :movie do
    title { Faker::Lorem.unique.sentence }
  end
end
