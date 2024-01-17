
class QuestionsController < ApplicationController
  before_action :set_quiz
  
  def show
    @question = @quiz.questions.find(params[:id])
    @next_question = @quiz.questions.where('id > ?', @question.id).first

    # クイズのレベルに応じた特別な処理
    case @quiz.level
      when 'beginner'
        # 初級者向けの処理
      when 'intermediate'
        # 中級者向けの処理
      when 'advanced'
        # 上級者向けの処理
      when 'maniac'
        # マニアック向けの処理
      when 'astro'
        # アストロレベルの処理
    end
  end

  def answer
    @question = @quiz.questions.find(params[:id])
    selected_choice = @question.choices.find_by(id: params[:answer])

    session[:answers] ||= {}
    # QuestionsControllerのanswerアクション

    session[:answers][@question.id.to_s] = selected_choice&.id

    # アストロレベルの場合の処理
   if @quiz.level == 'astro'
    clicked_x = params[:clicked_x].to_i
    clicked_y = params[:clicked_y].to_i
    is_correct = clicked_x.between?(@question.correct_x1, @question.correct_x2) &&
             clicked_y.between?(@question.correct_y1, @question.correct_y2)

     session[:answers][@question.id.to_s] = {
     clicked_x: clicked_x,
     clicked_y: clicked_y,
     is_correct: is_correct
     }

     # 不正解でも次の質問に進めるための処理
      next_question = @quiz.questions.where('id > ?', @question.id).first
      redirect_to next_question ? quiz_question_path(@quiz, next_question) : astro_results_quiz_path(@quiz) and return
  end

    if selected_choice.nil?
      # 無回答の場合
      flash[:alert] = "回答を選択してください。"
      redirect_to quiz_question_path(@quiz, @question)
    else
      # 次の質問にリダイレクト、またはクイズの終了
      next_question = @quiz.questions.where('id > ?', @question.id).first
      if next_question
        redirect_to quiz_question_path(@quiz, next_question) and return
      else
        # 最後の質問を回答した場合、結果ページにリダイレクト
        redirect_to results_quiz_path(@quiz)
      end
    end
  end

  private

  def set_quiz
  @quiz = Quiz.find(params[:quiz_id])
end
end
