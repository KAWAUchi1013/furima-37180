class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :first_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  validates :nickname, presence: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
