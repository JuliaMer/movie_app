class Role < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  validates :character, presence: true
  validates :movie_id, presence: true
  validates :actor_id, presence: true

  def find
    @roles = Role.find_by_actor_id(@role.actor_id)
  end
end
