class Staff < ActiveRecord::Base

  self.table_name = :staff

  has_many :authentications

  validates :phone, length: { maximum: 30 }, allow_blank: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  # Enabling others may require migrations to be made and run
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]

  def self.find_by_auth(auth_hash)
    auth_match = Authentications.find_by(provider: auth_hash['provider'], uid: auth_hash['uid'].to_s)

    if auth_match
      user = Staff.find(auth_match.staff_id)
    else
      user = Staff.find_by(email: auth_hash['info']['email'])

      if user
        Authentications.create staff_id: user.id, provider: auth_hash['provider'], uid: auth_hash['uid'].to_s
      end
    end

    user
  end
end
