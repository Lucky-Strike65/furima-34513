class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validatates :nickname
    validatates :first_name, format: {wiht: /\A[ぁ-んァ-ン一-龥]/,message:"全角ひらがな、全角カタカナ、漢字で入力して下さい"}
    validatates :last_name,  format: {wiht: /\A[ぁ-んァ-ン一-龥]/,message:"全角ひらがな、全角カタカナ、漢字で入力して下さい"}
    validatates :birthday
    validatates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"}
    validatates :last_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください"}
  end
end
