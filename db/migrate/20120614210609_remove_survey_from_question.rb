class RemoveSurveyFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :survey_id
  end

  def down
  end
end
