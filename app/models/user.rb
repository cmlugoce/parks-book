class User < ApplicationRecord

  has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    #validates :password, :confirmation => true #password_confirmation attr
    #validates_length_of :password, :in => 6..20, :on => :create

    has_many :parks, :dependent => :destroy
    has_many :comments
    has_many :trails, through: :comments, :dependent => :destroy
   
    def self.find_or_create_by_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password_digest = SecureRandom.hex
      user.name = auth.info.name
      user.save!
    end
  end
end
