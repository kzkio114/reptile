# app/controllers/quizzes_controller.rb
class QuizzesController < ApplicationController
 include GoogleApiConcern

  def astro_results
    @quiz = Quiz.find(params[:id])
    @answers = session[:answers] || {}   
  end

  def start_astro_quiz
  @quiz = Quiz.where(level: 'astro').first # 例として 'astro' レベルを仮定
    if @quiz && @quiz.questions.any?
      render 'start_astro_quiz', locals: { quiz: @quiz }
      else
        redirect_to root_path, alert: "アストロ君のクイズが利用可能ではありません。"
      end
    end
   
    def beginner
       @quiz = Quiz.where(level: 'beginner').first
      if @quiz && @quiz.questions.any?
        render 'beginner', locals: { quiz: @quiz }
      else
        redirect_to root_path, alert: "利用可能な初級者向けのクイズがありません。"
       end
    end
    
    def intermediate
      @quiz = Quiz.where(level: 'intermediate').first
      if @quiz && @quiz.questions.any?
         @question = @quiz.questions.first  # 最初の質問をセット
         render 'intermediate', locals: { quiz: @quiz }
      else
         redirect_to root_path, alert: "利用可能な種類当てクイズがありません。"
       end
    end
    
    def advanced
      @quiz = Quiz.where(level: 'advanced').first
      if @quiz && @quiz.questions.any?
        render 'advanced', locals: { quiz: @quiz }
      else
        redirect_to root_path, alert: "利用可能な中級者向けのクイズがありません。"
      end
    end
    
    def maniac
      @quiz = Quiz.where(level: 'maniac').first
       if @quiz && @quiz.questions.any?
         render 'maniac', locals: { quiz: @quiz }
      else
        redirect_to root_path, alert: "利用可能なマニアックなクイズがありません。"
      end
    end

    def results 
      byebug
      @answers = session[:answers] || {}
      Rails.logger.debug "直後の @answers: #{@answers.inspect}"
      @quiz = Quiz.find(params[:id])

      @correct_answers_count = 0
      @quiz.questions.each do |question|
        if @quiz.level == 'intermediate'
          # 中級レベルの場合、テキスト回答をチェック
          user_answer = @answers[question.id.to_s]['answer'] rescue nil
          correct_answers = question.answer.split(',').map(&:downcase)
          is_correct = correct_answers.include?(user_answer&.downcase)

          Rails.logger.debug "Question ID: #{question.id}, User Answer: '#{user_answer}', Correct Answers: #{correct_answers}, Is Correct: #{is_correct}"
         
          @correct_answers_count += 1 if is_correct
        else
          # その他のレベルの場合、選択した選択肢から回答をチェック
          user_answer_id = @answers[question.id.to_s]
          correct_choice = question.choices.find_by(correct: true)
          @correct_answers_count += 1 if correct_choice && user_answer_id == correct_choice.id
        end
      end
      # ここで正解数をデバッグ出力
      Rails.logger.debug "正解数: #{@correct_answers_count}"
      end
    
     def beginner_result
       # 必要なデータを取得
     end
           
     def intermediate_result
        # 必要なデータを取得
     end
          
     def advanced_result
        # 必要なデータを取得
     end
          
     def maniac_result
        # 必要なデータを取得
     end
end
