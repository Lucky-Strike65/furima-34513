require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができるとき' do
      it "nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameと
      first_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できないとき' do
      it 'emailが空のとき' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@が含まれていないと登録できない' do
        @user.email = 'abc111abc111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力して下さい')
      end
      it 'passwordは半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力して下さい')
      end
      it 'passwordは全角の場合は登録できない' do
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力して下さい')
      end
      it 'passwordが6文字以下じゃ登録できない' do
        @user.password = 'a1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_comfirmationが一致してないと登録できない' do
        @user.password = 'a11111'
        @user.password_confirmation = 'abc111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_nameが英字か含まれると登録できない' do
        @user.first_name = '名前a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'first_nameが数字か含まれると登録できない' do
        @user.first_name = '名前１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'last_nameが英字が含まれると登録できない' do
        @user.last_name = '名前abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'last_nameが数字が含まれると登録できない' do
        @user.last_name = '名前123'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'first_name_kanaがカタカナ以外だと登録できない' do
        @user.first_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は全角カタカナで入力してください')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end
      it 'last_name_kanaがカタカナ以外だと登録できない' do
        @user.last_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)は全角カタカナで入力してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
