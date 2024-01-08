class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :answer  # 記入回答のための新しいカラムを追加
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
