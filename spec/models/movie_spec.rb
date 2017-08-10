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

require 'rails_helper'

describe Movie do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
end
