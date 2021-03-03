class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format:{with: /\A[ぁ-んァ-ン一-龥々]/,message:"は全角ひらがな、全角カタカナ、漢字で入力して下さい"}
    validates :last_name,  format:{with: /\A[ぁ-んァ-ン一-龥々]/,message:"は全角ひらがな、全角カタカナ、漢字で入力して下さい"}
    validates :birthday
    validates :first_name_kana, format:{with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください"}
    validates :last_name_kana,  format:{with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください"}
    validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "は半角英数字混合で入力して下さい"}
  end
end
