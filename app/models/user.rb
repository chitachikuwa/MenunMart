class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :last_name, :first_name, :kana_last_name, :kana_first_name, presence: true
         validates :password,  length: {minimum: 6}, format: {with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         validates :last_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :first_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :kana_last_name, format: {with: /\A[ァ-ヶー]+\z/ }
         validates :kana_first_name,  format: {with: /\A[ァ-ヶー]+\z/ }       
end
