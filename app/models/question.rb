class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices, dependent: :destroy
  
  def correct_answers
    self.answers.split(',')
  end

  def astro_level?
    self.quiz.level == 'astro'
  end
end