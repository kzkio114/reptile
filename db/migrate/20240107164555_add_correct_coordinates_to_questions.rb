class AddCorrectCoordinatesToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :correct_x1, :integer
    add_column :questions, :correct_x2, :integer
    add_column :questions, :correct_y1, :integer
    add_column :questions, :correct_y2, :integer
  end
end