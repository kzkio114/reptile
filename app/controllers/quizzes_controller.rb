# app/controllers/quizzes_controller.rb
class QuizzesController < ApplicationController

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
        
        # ここにデバッグ出力を追加
        Rails.logger.debug "セッションに保存された回答: #{session[:answers].inspect}"
        
        @correct_answers_count = 0
        @quiz.questions.each do |question|
          # ユーザーの選んだ回答のIDを取得
          user_answer_id = @answers[question.id.to_s]
        
          # 正解の選択肢のIDを取得
          correct_choice = question.choices.find_by(correct: true)
        
          # ユーザーの回答が正解と一致する場合、カウントを増やす
          if correct_choice && user_answer_id == correct_choice.id
            @correct_answers_count += 1
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