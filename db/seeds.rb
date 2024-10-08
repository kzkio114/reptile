# db/seeds.rb

# 初心者向けクイズを取得または新しいクイズを作成し、レベルを設定
quiz_beginner = Quiz.find_or_create_by(title: "初心者向けクイズのタイトル", description: "初心者向けクイズの説明", level: "beginner")
quiz_intermediate = Quiz.find_or_create_by(title: "中級者向けクイズのタイトル", description: "画像当てクイズの説明", level: "intermediate")
quiz_advanced = Quiz.find_or_create_by(title: "上級者向けクイズのタイトル", description: "上級者向けクイズの説明", level: "advanced")
quiz_maniac = Quiz.find_or_create_by(title: "マニアックなクイズのタイトル", description: "マニアックなクイズの説明", level: "maniac")
quiz_astro = Quiz.find_or_create_by(title: "アストロレベルクイズのタイトル", description: "アストロレベルクイズの説明", level: "astro")



# 初心者向けクイズに質問を追加（既に存在しない場合のみ）
unless quiz_beginner.questions.exists?(content: "この中で、爬虫類はどれか？")
  question1 = quiz_beginner.questions.create(content: "この中で、爬虫類はどれか？")
  question1.choices.create(content: "イモリ", correct: false)
  question1.choices.create(content: "カエル", correct: false)
  question1.choices.create(content: "ヤモリ", correct: true)
  question1.choices.create(content: "ウーパールーパー", correct: false)
end

unless quiz_beginner.questions.exists?(content: "この中で、日本に居ない爬虫類の種類はどれか？")
  question2 = quiz_beginner.questions.create(content: "この中で、日本に居ない爬虫類の種類はどれか？")
  question2.choices.create(content: "ヘビ", correct: false)
  question2.choices.create(content: "リクガメ", correct: true)
  question2.choices.create(content: "トカゲ", correct: false)
  question2.choices.create(content: "ミズカメ", correct: false)
end

unless quiz_beginner.questions.exists?(content: "ヘビで足がある種類は？")
  question3 = quiz_beginner.questions.create(content: "ヘビで足がある種類は？")
  question3.choices.create(content: "いない？", correct: true)
  question3.choices.create(content: "いる？", correct: false)
end

unless quiz_beginner.questions.exists?(content: "この中で、ヤモリの漢字はどれが正しい？")
  question4 = quiz_beginner.questions.create(content: "この中で、ヤモリの漢字はどれが正しい？")
  question4.choices.create(content: "井守", correct: false)
  question4.choices.create(content: "壁虎", correct: false)
  question4.choices.create(content: "壁守", correct: false)
  question4.choices.create(content: "家守", correct: true)
end

unless quiz_beginner.questions.exists?(content: "カナヘビは、何の仲間？")
  question5 = quiz_beginner.questions.create(content: "カナヘビは、何の仲間？")
  question5.choices.create(content: "ヘビ", correct: false)
  question5.choices.create(content: "トカゲ", correct: true)
  question5.choices.create(content: "ワニ", correct: false)
  question5.choices.create(content: "カメ", correct: false)
end

unless quiz_advanced.questions.exists?(content: "ヒョウモントカゲモドキの別名は？")
    question = quiz_advanced.questions.create(content: "ヒョウモントカゲモドキの別名は？")
    question.choices.create(content: "ダイオウトカゲモドキ", correct: false)
    question.choices.create(content: "オバケトカゲモドキ", correct: false)
    question.choices.create(content: "レオパードゲッコー", correct: true)  
    question.choices.create(content: "サトプラトカゲモドキ", correct: false)
  end
  
  unless quiz_advanced.questions.exists?(content: "フトアゴヒゲトカゲの生息地は？")
    question = quiz_advanced.questions.create(content: "フトアゴヒゲトカゲの生息地は？")
    question.choices.create(content: "オーストラリア", correct: true)  # 正解
    question.choices.create(content: "マダガスカル", correct: false)
    question.choices.create(content: "日本", correct: false)
    question.choices.create(content: "アメリカ", correct: false)
  end
  
  unless quiz_advanced.questions.exists?(content: "クレステッドゲッコーの別名は？")
    question = quiz_advanced.questions.create(content: "クレステッドゲッコーの別名は？")
    question.choices.create(content: "オオカミミツドヤモリ", correct: false)
    question.choices.create(content: "オオキナオオカンヤモリ", correct: false)
    question.choices.create(content: "オウカンミカドヤモリ", correct: true)
    question.choices.create(content: "マダガスカルヒルヤモリ", correct: false)
  end
  
  unless quiz_advanced.questions.exists?(content: "この生息地の中で、カメレオンが生息していないのは？")
    question = quiz_advanced.questions.create(content: "この生息地の中で、カメレオンが生息していないのは？")
    question.choices.create(content: "ロシア", correct: true)
    question.choices.create(content: "アフリカ", correct: false)
    question.choices.create(content: "マダガスカル", correct: false)
    question.choices.create(content: "インド", correct: false)
  end
  
  unless quiz_advanced.questions.exists?(content: "この中で、トカゲモドキの仲間では？")
    question = quiz_advanced.questions.create(content: "この中で、トカゲモドキの仲間では？")
    question.choices.create(content: "ヒョウモンタコトカゲモドキ", correct: false) 
    question.choices.create(content: "ニセモノトカゲモドキ", correct: false)
    question.choices.create(content: "ニシアフリカトカゲモドキ", correct: true)  # 正解
    question.choices.create(content: "チュウオウアフリカトカゲモドキ", correct: false)
  end
  
  unless quiz_advanced.questions.exists?(content: "ニシアフリカトカゲモドキで存在しないモルフは？")
    question = quiz_advanced.questions.create(content: "ニシアフリカトカゲモドキで存在しないモルフは？")
    question.choices.create(content: "ホワイトアウトキャラメル", correct: false)
    question.choices.create(content: "レッドデビル", correct: true)  # 正解
    question.choices.create(content: "ゴースト", correct: false)
    question.choices.create(content: "ホワイトアウト", correct: false)
  end

  unless quiz_advanced.questions.exists?(content: "ヒョウモントカゲモドキのモルフでホワイト系は？")
    question = quiz_advanced.questions.create(content: "ヒョウモントカゲモドキのモルフでホワイト系は？")
    question.choices.create(content: "ブラックナイト", correct: false)
    question.choices.create(content: "ディアブロブランコ", correct: true)
    question.choices.create(content: "レッドデビル", correct: false) 
    question.choices.create(content: "タンジェリン", correct: false)
  end

  unless quiz_advanced.questions.exists?(content: "この中で、存在するリクガメの種類は？")
    question = quiz_advanced.questions.create(content: "この中で、存在するリクガメの種類は？")
    question.choices.create(content: "ナタデココリクガメ", correct: false)
    question.choices.create(content: "ショートケーキリクガメ", correct: false)
    question.choices.create(content: "パンケーキリクガメ", correct: true)  # 正解
    question.choices.create(content: "ピーナッツリクガメ", correct: false)
  end

  #maniac

  unless quiz_maniac.questions.exists?(content: "アミメミズベトカゲのオスはどっち？", image_url: "37518.jpg")
    question = quiz_maniac.questions.create(content: "アミメミズベトカゲのオスはどっち？", image_url: "37518.jpg")
    question.choices.create(content: "左", correct: false)  
    question.choices.create(content: "右", correct: true) # 正解１
  end

  unless quiz_maniac.questions.exists?(content: "アミメミズベトカゲの生息地は、マダガスカル島の○○○に、分布して○○にいる事が多い")
    question = quiz_maniac.questions.create(content: "アミメミズベトカゲの生息地は、マダガスカル島の○○○に、分布して○○にいる事が多い")
    question.choices.create(content: "南西部 森林", correct: false)  
    question.choices.create(content: "南西部 水田", correct: false)
    question.choices.create(content: "北西部 水田", correct: true) # 正解２
    question.choices.create(content: "南西部 川辺",correct: false)
  end

  unless quiz_maniac.questions.exists?(content: "アストロジャイアントダイビングスキンクの別名は？")
    question = quiz_maniac.questions.create(content: "アストロジャイアントダイビングスキンクの別名は？")
    question.choices.create(content: "アストロミズダイビングスキンク", correct: false)  
    question.choices.create(content: "アストロラーべミズベトカゲ" , correct: true)
    question.choices.create(content: "アストロラーべアストロラーべトカゲ", correct: false) # 正解３
    question.choices.create(content: "アストロジャイアントダイビングトカゲ", correct: false)
  end

  unless quiz_maniac.questions.exists?(content: "アストロジャイアントダイビングスキンクの生息地は、マダガスカル島の○○○に、分布している事が多い")
    question = quiz_maniac.questions.create(content: "アストロジャイアントダイビングスキンクの生息地は、マダガスカル島の○○○に、分布している事が多い")
    question.choices.create(content: "東中部", correct: true)  # 正解４
    question.choices.create(content: "南西部", correct: false)
    question.choices.create(content: "北西部", correct: false) 
    question.choices.create(content: "南中部", correct: false)
  end

  unless quiz_maniac.questions.exists?(content: "アストロジャイアントダイビングスキンクは○○に多くおり、エサは○○を食べることもある")
    question = quiz_maniac.questions.create(content: "アストロジャイアントダイビングスキンクは○○に多くおり、エサは○○を食べることもある")
    question.choices.create(content: "森林 果物", correct: false)  # 正解５
    question.choices.create(content: "地中 菌類", correct: false)
    question.choices.create(content: "川辺 カニ", correct: true) 
    question.choices.create(content: "砂漠 昆虫", correct: false)
  end

  unless quiz_maniac.questions.exists?(content: "繁殖は卵胎生で子供を直接産み、更にメスだけで繁殖する単為生殖はどれ？")
    question = quiz_maniac.questions.create(content: "繁殖は卵胎生で子供を直接産み、更にメスだけで繁殖する単為生殖はどれ？")
    question.choices.create(content: "モトイカブトトカゲ", correct: false)  
    question.choices.create(content: "アカメカブトトカゲ", correct: false)
    question.choices.create(content: "イボヨルトカゲ", correct: true) # 正解６
    question.choices.create(content: "シュミットカブトトカゲ", correct: false)
  end

  unless quiz_maniac.questions.exists?(content: "アミメミズベトカゲとアストロジャイアントダイビングスキンクとミミナシオオトカゲの共通は？")
    question = quiz_maniac.questions.create(content: "アミメミズベトカゲとアストロジャイアントダイビングスキンクとミミナシオオトカゲの共通は？")
    question.choices.create(content: "乾燥した所にずっといられる", correct: false)  
    question.choices.create(content: "水の中に、いられる", correct: true)
    question.choices.create(content: "ヤモリみたいに壁に張り付く", correct: false) # 正解７
    question.choices.create(content: "火の中にいられる" , correct: false)
  end

  unless quiz_maniac.questions.exists?(content: "ミミナシオオトカゲは何の先祖といわれてる？")
    question = quiz_maniac.questions.create(content: "ミミナシオオトカゲは何の先祖といわれてる？")
    question.choices.create(content: "トカゲ", correct: false)  
    question.choices.create(content: "ヤモリ", correct: false)
    question.choices.create(content: "ゴジラ", correct: false) # 正解８
    question.choices.create(content: "ヘビ", correct: true)
  end

  unless quiz_maniac.questions.exists?(content: "ミミナシオオトカゲの生息地の島は？")
    question = quiz_maniac.questions.create(content: "ミミナシオオトカゲの生息地の島は？")
    question.choices.create(content: "タリアブ島", correct: false)  
    question.choices.create(content: "ボルネオ島", correct: true)
    question.choices.create(content: "バンガ島", correct: false) # 正解９
    question.choices.create(content: "パラワン島", correct: false)
  end

  unless quiz_maniac.questions.exists?(content: "オオバクチヤモリの由来は？")
    question = quiz_maniac.questions.create(content: "オオバクチヤモリの由来は？")
    question.choices.create(content: "大きな生き物に警戒をせずに近づく為", correct: false)  
    question.choices.create(content: "餌を取る際に、小さい餌を使いより大きい餌を取るから", correct: false)
    question.choices.create(content: "餌が来るまで動かない", correct: false) # 正解９
    question.choices.create(content: "外敵に襲われた時に鱗を剥いで逃げる様から", correct:  true)
  end


  image_urls = ["asutoro01.jpg", "asutoro02.jpg", "asutoro03.jpg", "asutoro04.jpg", "asutoro05.jpg", "asutoro06.jpg", "asutoro07.jpg"]

correct_coordinates = [
  { x1: 320, x2: 500, y1: 100, y2: 210 },
  { x1: 280, x2: 390, y1: 150, y2: 305 },
  { x1: 210, x2: 350, y1: 190, y2: 270 },
  { x1: 400, x2: 500, y1: 220, y2: 290 },
  { x1: 300, x2: 400, y1: 170, y2: 270 },
  { x1: 270, x2: 340, y1: 160, y2: 220 },
  { x1: 130, x2: 200, y1: 160, y2: 250 }
]

image_urls.each_with_index do |image_url, index|
  content = "どこに隠れてますか？？  #{index + 1}問目"
  coordinates = correct_coordinates[index]

  unless quiz_astro.questions.exists?(content: content, image_url: image_url)
    quiz_astro.questions.create(
      content: content,
      image_url: image_url,
      correct_x1: coordinates[:x1],
      correct_x2: coordinates[:x2],
      correct_y1: coordinates[:y1],
      correct_y2: coordinates[:y2]
    )
  end
end


# 画像を使った質問を追加
image_questions = [
  { content: "この爬虫類は何でしょう?", image_url: "アカア○リクガメ.jpg", answer: "アカアシリクガメ" },
  { content: "この爬虫類は何でしょう?", image_url: "オニプレ○トトカゲ.jpg", answer: "オニプレートトカゲ" },
  { content: "この爬虫類は何でしょう?", image_url: "シミリスモ○ター.jpg", answer: "シミリスモニター" },
  { content: "この爬虫類は何でしょう?", image_url: "ソトイ○トカゲ.jpg", answer: "ソトイワトカゲ" },
  { content: "この爬虫類は何でしょう?", image_url: "ニ○ントカゲ.jpg", answer: "ニホントカゲ" },
  { content: "この爬虫類は何でしょう?", image_url: "バクチヤモ○.jpg", answer: "バクチヤモリ" },
  { content: "この爬虫類は何でしょう?", image_url: "ヒナタヨロ○トカゲ.jpg", answer: "ヒナタヨロイトカゲ" },
  { content: "この爬虫類は何でしょう?", image_url: "フェルナンデスス○ンク.jpg", answer: "フェルナンデススキンク" },
  { content: "この爬虫類は何でしょう?", image_url: "ミューラスキ○ク.jpg", answer: "ミューラスキンク" },
  { content: "この爬虫類は何でしょう?", image_url: "レオパードゲッコー.jpg", answer: "レオパードゲッコー,ヒョウモントカゲモドキ"}
  # 他の質問を追加できます
]


# 画像を使った質問を追加
image_questions.each do |iq|
  unless quiz_intermediate.questions.exists?(content: iq[:content], image_url: iq[:image_url])
    # `answer` 属性を使って質問を作成
    quiz_intermediate.questions.create(content: iq[:content], image_url: iq[:image_url], answer: iq[:answer])
  end
end


  
  
  
  
  
  
  
  