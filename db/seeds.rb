# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'admintest'
)

customer = Customer.create!(
  [
    {
      email: 'gunnma@example.com', last_name: '群馬', first_name: '太郎', nickname: 'グンマ',
      phone_number: '0123456789', profile: '山が好きです。', password: 'password',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer1.png"), filename:"sample-customer1.png")
    },
    {
      email: 'machiko@example.com', last_name: '吉岡', first_name: '町子', nickname: 'まっちー',
      phone_number: '0987654321', profile: '旅行したらどんどん投稿します！', password: 'password',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer2.png"), filename:"sample-customer2.png")
    },
    {
      email: 'takasaki@example.com', last_name: '高崎', first_name: '鶴江', nickname: 'つるさん',
      phone_number: '01478523690', profile: 'よろしくお願いします。', password: 'password',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer3.png"), filename:"sample-customer3.png")
    }
  ]
)

Post.create!(
  [
    {
      post_name: '鍋割山（荒山）', address: '群馬県前橋市富士見町赤城山2034-1',
      introduction: '赤城にある鍋割山の荒山に行ってきました。晴れていて景色がよくハイキング日和でした。住所は駐車場の手前にある焼きとうもろこしのお店のものです。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"),
      area: 2, customer_id: customer[0].id
    },
    {
      post_name: '博多一路', address: '群馬県前橋市大島町410-7',
      introduction: '本格的な豚骨ラーメンが食べられるお店です！混んでいますが美味しいのでぜひ行ってみてください！',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"),
      area: 2, customer_id: customer[0].id
    },
    {
      post_name: '河鹿橋', address: '群馬県渋川市伊香保町伊香保590',
      introduction: '夜に散歩で行った時の写真なので見づらいですが、木々の中にあり昼間は綺麗な橋を見ることができます。紅葉の時期にライトアップされてとても綺麗なのでおすすめです。近くに温泉やペヤングで有名になった石段などもあります。近くのロープウェイで見晴らしのいい展望台にも行けるので天気がいい日はぜひ行ってみてください！',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"),
      area: 2, customer_id: customer[1].id
    },
    {
      post_name: '草津温泉の湯畑', address: '群馬県吾妻郡草津町草津401',
      introduction: '草津温泉の湯畑です！昼間でもどの季節でも見応えがあるのでおすすめです。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"),
      area: 1, customer_id: customer[1].id
    },
    {
      post_name: '西の河原公園', address: '群馬県吾妻郡草津町草津521-3',
      introduction: '草津温泉の近くにあります。途中に露天風呂や小さな神社などもあります。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"),
      area: 1, customer_id: customer[2].id
    },
    {
      post_name: '八瀬川公園', address: '群馬県太田市本町36-1',
      introduction: '桜を見に行ってきました。見頃は過ぎていましたが綺麗に咲いていました。',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"),
      area: 4, customer_id: customer[2].id
    }
  ]
)