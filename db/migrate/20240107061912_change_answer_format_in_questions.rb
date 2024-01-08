class ChangeAnswerFormatInQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :answers, :json, default: {}
    remove_column :questions, :answer, :string if column_exists?(:questions, :answer)
  end
end  
