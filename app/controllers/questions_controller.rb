#require 'google/apis/drive_v3'
#require 'googleauth'
#require 'googleauth/stores/file_token_store'

class QuestionsController < ApplicationController
  before_action :set_quiz
  
  def show
    @question = @quiz.questions.find(params[:id])
    @next_question = @quiz.questions.where('id > ?', @question.id).first
   
    # Google Drive APIクライアントの初期化
    #service = Google::Apis::DriveV3::DriveService.new
    #service.client_options.application_name = 'reptile-recommend'
    #service.key = ENV['GOOGLE_API_KEY'] #Google Drive APIクライアントを初期化する際に、APIキーを設定するコード
    
    # ここに認証情報を設定

    #client_id = Google::Auth::ClientId.from_hash(JSON.parse(ENV['GOOGLE_CLIENT_SECRET']))
    #token_store = Google::Auth::Stores::FileTokenStore.new(file: Rails.root.join('config', 'tokens.yaml'))
    #authorizer = Google::Auth::UserAuthorizer.new(client_id, Google::Apis::DriveV3::AUTH_DRIVE_READONLY, token_store)
    #user_id = 'kzkio114@gmail.com'
    #credentials = authorizer.get_credentials(user_id)
    #service.authorization = credentials

    

    # 画像ファイルのリストを取得するためのDrive APIの使用
    #folder_id = '113FpN_5gjtwSbYGSNo9li4DlXomt4lIN' # ここに検索したいフォルダのIDを設定
    #response = service.list_files(
      #q: "('#{folder_id}' in parents) and (mimeType='image/jpeg' or mimeType='image/png')",
      #spaces: 'drive',
      #fields: 'files(id, name, web_view_link, web_content_link)',
      #page_token: page_token
    #)

    # 画像URLの取得
    #@images = response.files.map do |file|
     # file.web_view_link # web_content_linkを使用してダウンロードURLを取得することも可能
    #end
  
    # ランダムな画像URLの選択
    #@random_image_url = @images.sample unless @images.empty?

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
