class CreateCompetitionTags < ActiveRecord::Migration[7.1]
  def change
    create_table :competition_tags do |t|
      t.string :tag

      t.timestamps
    end
  end
end
