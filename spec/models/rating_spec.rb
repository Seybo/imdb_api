# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  movie_id   :integer
#  value      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ratings_on_movie_id              (movie_id)
#  index_ratings_on_user_id               (user_id)
#  index_ratings_on_user_id_and_movie_id  (user_id,movie_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

describe Rating do
  it { should belong_to(:user) }
  it { should belong_to(:movie) }
  it { should validate_presence_of(:value) }
end
