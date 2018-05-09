class Role < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  validates :character, presence: true
  validates :movie_id, presence: true
  validates :actor_id, presence: true
  before_validation :check_role_existence

  def check_role_existence
    role = Role.find_by_character(character)
    if !role.blank?
      if role.movie_id == movie_id
        errors.add(:character, "already existing")
      end
    end
  end
end
