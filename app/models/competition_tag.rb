class CompetitionTag < ApplicationRecord
  has_and_belongs_to_many :competitions

  #scope :tag_search, -> (tag){ where("id LIKE ?", tag) }
end
