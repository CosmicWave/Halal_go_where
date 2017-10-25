class Foody < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         mount_uploader :avatar, AvatarUploader

  devise :omniauthable, omniauth_providers: [:facebook]


  has_many :photos, dependent: :destroy
  #has_many :likes,  dependent: :destroy
  #has_many :dislikes,  dependent: :destroy
  has_many :recommends, dependent: :destroy
  has_many :disapproves, dependent: :destroy
  #has_many :reviews,  dependent: :destroy




  def self.new_with_session(params, session)
    super.tap do |foody|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        foody.email = data["email"] if foody.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |foody|
      foody.email = auth.info.email
      foody.password = Devise.friendly_token[0,20]
      foody.name = auth.info.name   # assuming the foody model has a name
      foody.image = auth.info.image # assuming the foody model has an image
    end
  end

end
