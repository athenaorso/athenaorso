class Competition < ApplicationRecord
  has_and_belongs_to_many :competition_tags
  accepts_nested_attributes_for :competition_tags

  #Scopes
  scope :text_search, -> (search){ where("name LIKE ?", "%#{search}%").or(where("description LIKE ?", "%#{search}%")).or(where("topic LIKE ?", "%#{search}%"))}
  scope :valid_age, -> (age){ where("? >= age_from ", age).and(where("? <= age_to", age))}
  #scope :tag_search, -> (tag, competition){ where("#{competition.competition_tag_id} LIKE ?", tag) }

  def possible_new_competition_tags
    CompetitionTag.all #- competition_tags
  end
end
