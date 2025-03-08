class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_many :issues, dependent: :destroy

  has_many :given_appointments, foreign_key: :tutor_id, class_name: "Appointment", dependent: :destroy
  has_many :received_appointments, foreign_key: :pupil_id, class_name: "Appointment", dependent: :destroy

  # geocoded_by :github_location
  # after_validation :geocode, if: :github_location_changed?
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :github_avatar_url, presence: true
  validates :github_username, presence: true
  validates :github_name, presence: true
  validates :github_uid, presence: true, uniqueness: true
  validates :provider, presence: true

  before_validation :set_defaults_for_basic_signup, on: :create
  after_validation :log_errors

  def log_errors
    Rails.logger.error "Validation failed: #{errors.full_messages.join(', ')}"
  end

  def set_defaults_for_basic_signup
    if self.email
      self.provider ||= "basic"
      self.github_uid ||= SecureRandom.uuid
      self.github_username ||= email.split('@').first
      self.github_name ||= email.split('@').first.capitalize
      self.github_avatar_url ||= "avataaars.png"
    end
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    provider = access_token.provider
    random_string = Devise.friendly_token[0, 6]
    uid = access_token.uid.presence || SecureRandom.uuid
    location = access_token.extra.raw_info['location'].presence || ""

    email = data['email'].presence || "user_#{random_string}@email.com"
    nickname = data['nickname'].presence || email.split('@').first
    name = data['name'].presence || nickname.capitalize
    image = data['image'].presence || "avataaars.png"

    # debugger
    # user = User.where(email: data['email']).first
    user = User.find_by(github_username: data['nickname'])

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create!(
        email: email,
        password: Devise.friendly_token[0, 20],
        github_username: nickname,
        github_name: name,
        github_avatar_url: image,
        github_location: location,
        provider: provider || "github",
        github_uid: uid
      )
    end

    user
  end


  # def set_defaults_for_basic_signup
  #   if provider.blank? || provider == "basic"
  #     self.provider ||= "basic"
  #     self.uid ||= SecureRandom.uuid
  #     self.github_username ||= email.split('@').first
  #     self.github_name ||= email.split('@').first.capitalize
  #     self.github_avatar_url ||= "avataaars.png"
  #     self.github_location ||= ""
  #   end
  # end
end
