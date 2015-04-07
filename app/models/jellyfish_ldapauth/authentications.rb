module JellyfishLdapauth
  class Authentications < ActiveRecord::Base
    belongs_to :staff

    validates :provider, :uid, presence: true
  end
end
