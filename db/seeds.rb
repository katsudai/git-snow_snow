Admin.create!(
    email: 'snow_snow@example.com',
    password: 'snow_snow',
)

Genre.create!(
    [{name: "スノーボード"}, {name: "スキー"}, {name: "セパレートスノーボード"}, {name: "スノースクート"}]
  )

Tag.create!(
    [{name: "スノーボード"}, {name: "スキー"}, {name: "スノーボード初心者"}, {name: "グラトリ"}]
  )

users = User.create!(
  [
    {email: 'mana@example.com', name: 'mana', password: 'manamana', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg"), genre_id: 1, introduction: "今年からスノーボード始めました！初心者ですが、よろしくお願いします。", action_range: 20},
    {email: 'kenta@example.com', name: 'kenta', password: 'kentakenta', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg"), genre_id: 1, introduction: "グラトリメインで活動しています！", action_range: 17},
    {email: 'kaito@example.com', name: 'kaito', password: 'kaitokaito', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg"), genre_id: 1, introduction: "北海道で一緒に滑れる人を募集しています！", action_range: 1},
    {email: 'taro@example.com', name: 'taro', password: 'tarotaro', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg"), genre_id: 1, introduction: "スノーボード歴3年目です！よろしくお願いします！", action_range: 21},
    {email: 'taturo@example.com', name: 'taturo', password: 'taturo', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg"), genre_id: 2, introduction: "スノーボードもしますが、スキーもします！よろしくお願いします！", action_range: 23}
  ]
)

Post.create!(
  [
    {body: 'きれいな雪景色だった！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), user_id: users[0].id, address: "長野県北安曇郡小谷村千国乙12840-1"},
    {body: 'グラトリ難しい！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), user_id: users[1].id, address: "石川県白山市河内町内尾ロ202"},
    {body: '蝦夷富士が綺麗過ぎた！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), user_id: users[2].id, address: "北海道虻田郡ニセコ町ニセコ485"},
    {body: '朝から夜まで滑り倒した！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), user_id: users[3].id, address: "岐阜県郡上市高鷲町大鷲3250"},
    {body: '雪が降った次の日が晴れると最高のコンディション！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), user_id: users[4].id}
  ]
)

PostTag.create!(
    [{post_id: 1, tag_id: 3}, {post_id: 2, tag_id: 4}, {post_id: 3, tag_id: 1}, {post_id: 4, tag_id: 1}, {post_id: 5, tag_id: 1},]
  )

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
