class AddDescriptionToQuizzes < ActiveRecord::Migration[7.1]
  def change
    add_column :quizzes, :description, :string
  end
end
