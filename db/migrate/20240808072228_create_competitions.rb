class CreateCompetitions < ActiveRecord::Migration[7.1]
  def change
    create_table :competitions do |t|
      t.string :name
      t.text :description
      t.string :topic
      t.integer :age_from
      t.integer :age_to

      t.timestamps
    end
  end
end
