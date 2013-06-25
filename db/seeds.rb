require 'faker'

15.times do |user|
  user_params = {}

  user_params[:first_name] = Faker::Name.first_name
  user_params[:last_name] = Faker::Name.last_name
  user_params[:email] = Faker::Internet.email
  user_params[:password] = 'password'
  user_params[:password_confirmation] = 'password'

  User.create(user_params)

end

150.times do |url|
  user_id = (1..15).to_a.sample
  user = User.find(user_id)
  user.urls << Url.create(original_url: Faker::Internet.url)
end
