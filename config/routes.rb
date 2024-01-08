Rails.application.routes.draw do
  root "pages#index"

  resources :quizzes, only: [:index] do
    member do
      get 'results', to: 'quizzes#results'
    end
    
    resources :questions, only: [:show] do
      post 'answer', on: :member
    end
  end

   # アストロクイズの開始ページへのルート
  get 'quizzes/start_astro', to: 'quizzes#start_astro_quiz', as: 'start_astro_quiz'
    # クイズの回答を処理するルート
  post 'quizzes/astro_answers', to: 'quizzes#astro_answers', as: 'astro_quiz_answers'
    # クイズの結果を表示するルート
    get 'quizzes/:id/astro_results', to: 'quizzes#astro_results', as: 'astro_results_quiz'
  
  get 'quizzes/beginner', to: 'quizzes#beginner', as: 'beginner_quiz'
  get 'quizzes/intermediate', to: 'quizzes#intermediate', as: 'intermediate_quiz'
  get 'quizzes/advanced', to: 'quizzes#advanced', as: 'advanced_quiz'
  get 'quizzes/maniac', to: 'quizzes#maniac', as: 'maniac_quiz'
  
  get 'quizzes/beginner_result', to: 'quizzes#beginner_result', as: 'beginner_result'
  get 'quizzes/intermediate_result', to: 'quizzes#intermediate_result', as: 'intermediate_result'
  get 'quizzes/advanced_result', to: 'quizzes#advanced_result', as: 'advanced_result'
  get 'quizzes/maniac_result', to: 'quizzes#maniac_result', as: 'maniac_result'

  get '/correct', to: 'pages#correct', as: 'correct_page'
  get '/incorrect', to: 'pages#incorrect', as: 'incorrect_page'
end
