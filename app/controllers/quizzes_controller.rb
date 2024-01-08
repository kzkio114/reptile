# app/controllers/quizzes_controller.rb
class QuizzesController < ApplicationController
   
  def astro_results
    @quiz = Quiz.find(params[:id])
    # 'quizzes/astro_results.html.erb' ビューが表示されます。
  end

  def start_astro_quiz
    # アストロレベルのクイズを開始するアクション。
    @quiz = Quiz.where(level: 'astro').first # 'astro' レベルのクイズを探す。
    if @quiz && @quiz.questions.any?
      # クイズが存在し、質問がある場合、開始ページを表示。
      render 'start_astro_quiz', locals: { quiz: @quiz }
    else
      # クイズがない場合、ルートページにリダイレクト。
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
          render 'intermediate', locals: { quiz: @quiz }
        else
          redirect_to root_path, alert: "利用可能な中級者向けのクイズがありません。"
        end
      end
    
      def advanced
        @quiz = Quiz.where(level: 'advanced').first
        if @quiz && @quiz.questions.any?
          render 'advanced', locals: { quiz: @quiz }
        else
          redirect_to root_path, alert: "利用可能な上級者向けのクイズがありません。"
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
        @quiz = Quiz.find(params[:id])
        @answers = session[:answers] || {}
    
        # 正解数をカウント
        @correct_answers_count = 0
        @quiz.questions.each do |question|
          if @quiz.level == 'astro'
            # アストロレベルの場合の処理
            answer = @answers[question.id.to_s]
            if answer && answer[:is_correct]
              @correct_answers_count += 1
            end
          else
            # 通常のクイズレベルの場合の処理
            user_answer_id = @answers[question.id.to_s]
            correct_choice = question.choices.find_by(correct: true)
            if correct_choice && user_answer_id == correct_choice.id.to_s
              @correct_answers_count += 1
            end
          end
        end
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