require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとfirstnameとlastnameとkana_firstnameとkana_lastnameとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationは英数字6文字以上であれば登録できる' do
        @user.password = 'a000000'
        @user.password_confirmation = 'a000000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'firstnameが半角では登録できない' do
        @user.firstname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end

      it 'laststnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'laststnameが半角では登録できない' do
        @user.lastname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end

      it 'kana_firstnameが空では登録できない' do
        @user.kana_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana firstname can't be blank")
      end

      it 'kana_firstnameはカタカナ以外では登録できない' do
        @user.kana_firstname = 'あ青ta'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana firstname is invalid')
      end

      it 'kana_lastnameが空では登録できない' do
        @user.kana_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana lastname can't be blank")
      end

      it 'kana_lastnameはカタカナ以外では登録できない' do
        @user.kana_lastname = 'あ青te'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana lastname is invalid')
      end

      it 'birthdayが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは英字と数字の両方を入力しないと登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end
