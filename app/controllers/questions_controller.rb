class QuestionsController < ApplicationController
    before_action :set_quiz
    
    def show
        @question = @quiz.questions.find(params[:id])
        
        

        
            # クイズのレベルに基づいた処理をここに記述します。
            case @quiz.level
            when 'beginner'
              # 初級者向けの特別な処理
            when 'intermediate'
              # 中級者向けの特別な処理
            when 'advanced'
              # 上級者向けの特別な処理
            when 'maniac'
              # マニアックなクイズ向けの特別な処理
            end
    
    end
  
    def answer
      @question = @quiz.questions.find(params[:id])
      selected_choice = @question.choices.find_by(id: params[:answer])
  
      session[:answers] ||= {}
      # QuestionsControllerのanswerアクション

      session[:answers][@question.id.to_s] = selected_choice&.id
 
      if selected_choice.nil?
        # 無回答の場合
        flash[:alert] = "回答を選択してください。"
        redirect_to quiz_question_path(@quiz, @question)
      else
        # 次の質問にリダイレクト、またはクイズの終了
        next_question = @quiz.questions.where('id > ?', @question.id).first
        if next_question
          redirect_to quiz_question_path(@quiz, next_question)
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
