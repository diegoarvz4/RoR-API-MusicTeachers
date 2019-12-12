class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  validates_presence_of :username, :email, :password_digest
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
