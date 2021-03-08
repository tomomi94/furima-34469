require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'nicknameが41文字以上では登録できない' do
        @user.nickname = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname is too long (maximum is 40 characters)")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
      it 'emailで@が含まれていない場合登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "111aa"
        @user.password_confirmation = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英数字が混合ではない場合登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it 'passwordが半角英語のみ(6桁)の場合登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it 'passwordが全角英語のみ(6桁)の場合登録できない' do
        @user.password = "ＳＳＳＳＳＳ"
        @user.password_confirmation = "ＳＳＳＳＳＳ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していない場合登録できない' do
        @user.password = "111aaa"
        @user.password_confirmation = "222ccc"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
      it 'first_name_kanaがカタカナではない場合登録できない' do
        @user.first_name_kana = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
      it 'last_name_kanaがカタカナではない場合登録できない' do
        @user.last_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana is invalid")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birth day can't be blank")
      end
    end
  end
end