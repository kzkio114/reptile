class AddNameToQuizzes < ActiveRecord::Migration[7.1]
  def change
    add_column :quizzes, :name, :string
  end
end
