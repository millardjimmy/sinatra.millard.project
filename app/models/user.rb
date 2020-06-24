class User < ActiveRecord::Base
    has_secure_password
    has_many :incidents

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true

end
