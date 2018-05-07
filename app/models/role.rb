class Role < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  validates :character, presence: true
  validates :movie_id, presence: true
  validates :actor_id, presence: true
  before_validation :role_already_existing

  def find
    @roles = Role.find_by_actor_id(@role.actor_id)
  end


  def role_already_existing
    role = Role.find_by_character(character)
    if !role.blank?
      if role.movie_id == movie_id
        errors.add(:character, "already existing")
      end
      @character = role
    end
  end
end
