class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  has_many :choices, dependent: :destroy  # この行を追加
end