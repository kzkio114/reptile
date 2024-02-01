class AddAnswerValidationToQuestions < ActiveRecord::Migration[7.1]
  def up
    change_column :questions, :answer, :string, limit: 25
  end

  def down
    change_column :questions, :answer, :string
  end
end