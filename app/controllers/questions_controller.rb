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

    elsif @quiz.level == 'intermediate'
      # 中級レベルの回答処理
      user_answer = params[:answer]&.strip&.downcase # ユーザーが入力した回答を安全に取得し、前後の空白を削除、小文字に変換
      if @question.answer.present?
        correct_answers = @question.answer.downcase.split(',') # 正しい回答を小文字に変換し、カンマで分割して配列にする
        is_correct = correct_answers.include?(user_answer) # ユーザーの回答が正しい回答の配列に含まれているかどうかをチェック
        session[:answers][@question.id.to_s] = { answer: user_answer, is_correct: is_correct }
        
        if is_correct
          session[:answers][@question.id.to_s] = { answer: user_answer, is_correct: true }
          flash[:notice] = "正解？？！！え？？正解出すの？？？すごすぎる・・・？？？"
        else
          session[:answers][@question.id.to_s] = { answer: user_answer, is_correct: false }
          flash[:alert] = "不正解だけど、落ち込まないでわからないのが当たり前だよ！！！"
        end
      else
        flash[:alert] = "この質問の正解が設定されていません。ごめんなさい・・・！！"
      end

      # バリデーションチェックを追加
      if user_answer.blank? || user_answer.length <= 25
      # ユーザーの回答が存在し、25文字以下の場合、処理を続行
      # 次の質問にリダイレクト、またはクイズの終了
       next_question = @quiz.questions.where('id > ?', @question.id).first
      if next_question
       redirect_to quiz_question_path(@quiz, next_question) and return
      else
      # 最後の質問を回答した場合、結果ページにリダイレクト
      redirect_to results_quiz_path(@quiz) and return
      end
     else
      # ユーザーの回答が25文字を超える場合、エラーメッセージを表示
      flash[:alert] = "回答は、25文字以下で入力してね〜！"
      redirect_to quiz_question_path(@quiz, @question) and return
     end
   end
  
   if selected_choice.nil?
    # 無回答の場合
    flash[:alert] = "回答を選んでくれないと進めないです！！"
    redirect_to quiz_question_path(@quiz, @question)
  else
    # 選択肢が存在する場合、正解と比較して判定
    if selected_choice.correct?
      session[:answers][@question.id.to_s] = { choice_id: selected_choice.id, is_correct: true }
      flash[:notice] = "正解！！おめでとうございます！！"
    else
      session[:answers][@question.id.to_s] = { choice_id: selected_choice.id, is_correct: false }
      flash[:alert] = "不正解だけど、落ち込まないで！解けないのが普通だよ！！！！"
    end

    # 次の質問にリダイレクト、またはクイズの終了
    next_question = @quiz.questions.where('id > ?', @question.id).first
    if next_question
      redirect_to quiz_question_path(@quiz, next_question)
    else
      redirect_to results_quiz_path(@quiz)
    end
  end
end

  private

  def set_quiz
  @quiz = Quiz.find(params[:quiz_id])
  end
end
