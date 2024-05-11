class AddCorrectToChoices < ActiveRecord::Migration[7.1]
  def change
    add_column :choices, :correct, :boolean
  end
end
