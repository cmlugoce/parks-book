class User < ApplicationRecord

  has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 8, allow_nil: true },
    confirmation: true

    has_many :parks, :dependent => :destroy
    has_many :trails, through: :parks
    has_many:comments
   
    def self.find_or_create_by_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = SecureRandom.hex
      user.name = auth.info.name
    end
  end
end
