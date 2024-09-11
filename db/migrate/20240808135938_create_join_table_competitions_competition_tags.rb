class CreateJoinTableCompetitionsCompetitionTags < ActiveRecord::Migration[7.1]
  def change
    create_join_table :competitions, :competition_tags do |t|
      # t.index [:competition_id, :competition_tag_id]
      # t.index [:competition_tag_id, :competition_id]
    end
  end
end
