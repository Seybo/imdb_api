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

require 'rails_helper'

describe Movie do
  it { should have_many(:ratings) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
end
