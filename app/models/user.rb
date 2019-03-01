require 'openssl'

class User < ApplicationRecord
  # Параметры работы модуля шифрования паролей
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :questions, dependent: :destroy
  has_many :authored_questions, class_name: "Question", foreign_key: "author_id", dependent: :nullify

  validates :email, presence: true, uniqueness: true, format:{with: VALID_EMAIL_REGEX}
  validates :username, presence: true, uniqueness: true, format: {with: /\w+/},length:{maximum: 40}
  validates :bg_color, format: {with: /\A#([0-9a-f]{3}){1,2}\z/i}, allow_blank:  true
  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_validation :downcase_username
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, password_salt,ITERATIONS,
                                                                          DIGEST.length, DIGEST ))
    end
  end

    def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end


  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
      password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))

    return user if user.password_hash == hashed_password

    nil
  end

  def downcase_username
    self.username = username.downcase unless username.blank?
  end

end
