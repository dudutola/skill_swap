class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(access_token)
    data = access_token.info
    provider = access_token.provider
    random_string = Devise.friendly_token[0, 6]
    uid = access_token.uid.presence || SecureRandom.uuid

    email = data['email'].presence || "user_#{random_string}@email.com"
    nickname = data['nickname'].presence || "user_#{random_string}"
    name = data['name'].presence || "No Name #{random_string}"
    image = data['image'].presence || "default_avatar.png"

    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create!(
        email: email,
        password: Devise.friendly_token[0, 20],
        github_username: nickname,
        github_name: name,
        github_avatar_url: image,
        provider: provider || "github",
        github_uid: uid
      )
    end

    user
  end
end
