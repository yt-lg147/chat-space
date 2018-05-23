FactoryGirl.define do
  factory :user do
    # Faker::Internet 任意の文字列作成ドット以降で扱いが変わる
    password = Faker::Internet.password(8) # .password:min_length=8の文字列を作成
    name Faker::Name.last_name
    email Faker::Internet.free_email # .free_email: フリーのアドレス(gmail,yahoo)を使用
    password password
    password_confirmation password
  end
end
