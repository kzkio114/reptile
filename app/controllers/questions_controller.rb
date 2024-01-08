class QuestionsController < ApplicationController
  before_action :set_quiz
  
  def show # showアクション: 特定の質問を表示
    @question = @quiz.questions.find(params[:id])
    @next_question = @quiz.questions.where('id > ?', @question.id).first
    
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
    when 'astro'
      # アストロレベル向けの特別な処理（画像クリックイベント用）
      # ここで必要な変数や情報を@変数に格納してビューに渡す
      @image_click_event = @quiz.level == 'astro' if @quiz.level == 'astro'
    end
  end

  def answer
    @question = @quiz.questions.find(params[:id])
    session[:answers] ||= {}
  
    if @quiz.level == 'astro'
      clicked_x = params[:clicked_x].to_i
      clicked_y = params[:clicked_y].to_i
      is_correct = clicked_x.between?(@question.correct_x1, @question.correct_x2) &&
                   clicked_y.between?(@question.correct_y1, @question.correct_y2)
  
      # アストロレベルの場合、正誤とクリックされた座標を保存
      session[:answers][@question.id.to_s] = { 
        clicked_x: clicked_x, 
        clicked_y: clicked_y, 
        is_correct: is_correct 
      }
    else
      # 通常のクイズレベルの場合、選択された選択肢と正誤を保存
      selected_choice = @question.choices.find_by(id: params[:answer])
      is_correct = selected_choice&.correct?
      session[:answers][@question.id.to_s] = { 
        choice_id: selected_choice&.id, 
        is_correct: is_correct 
      }
    end
  
    redirect_to next_question_or_result_path
  end

  private

  # set_quizメソッド: クイズを設定
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  # next_question_or_result_pathメソッド: 次の質問または結果ページへのパスを返す
  def next_question_or_result_path
    if @quiz.questions.where('id > ?', @question.id).exists?
      quiz_question_path(@quiz, @quiz.questions.where('id > ?', @question.id).first)
    else
      # アストロレベルの場合はアストロ専用の結果ページにリダイレクト
      @quiz.level == 'astro' ? astro_results_quiz_path(@quiz) : results_quiz_path(@quiz)
    end
  end

  # アストロレベル用の結果ページへのパスを返すメソッド
  def astro_results_quiz_path(quiz)
    
    
    # 'quizzes/astro_results' ビューをレンダリング
    "/quizzes/#{quiz.id}/astro_results"
  end

  # ... [その他のプライベートメソッド] ...
end