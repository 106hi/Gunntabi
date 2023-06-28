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
    }
  ]
)

Post.create!(
  [
    {
      post_name: '河鹿橋',
      introduction: '夜に散歩で行った時の写真なので見づらいですが、木々の中にあり昼間は綺麗な橋を見ることができます。紅葉の時期にライトアップされてとても綺麗なのでおすすめです。近くに温泉やペヤングで有名になった石段などもあります。近くのロープウェイで見晴らしのいい展望台にも行けるので天気がいい日はぜひ行ってみてください！',
      address: '群馬県渋川市伊香保町伊香保590',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"),
      customer_id: customer[1].id
    }
  ]
)