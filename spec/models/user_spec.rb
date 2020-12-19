
require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do

      it "nicknameとemail、passwordとpassword_confirmation、本名の名字と名前を全角（漢字・ひらがな・カタカナ）でそれぞれ入力、ユーザー本名のフリガナを全角（カタカナ）でそれぞれ入力、生年月日を入力すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@がないと登録できない" do
        @user.email = "aaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "password_confirmationが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordとpassword_confirmationの値が一致していないと登録できない" do
        @user.password = "a00000"
        @user.password_confirmation = "b00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "本名の名字が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "本名の名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "本名の名字が全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.last_name = "1aAｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "本名の名前が全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.first_name = "1aAｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "本名の名字のフリガナが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "本名の名前のフリガナが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "本名の名字のフリガナが全角（カタカナ）以外だと登録できない" do
      @user.last_name_kana = "1aAｱあ一"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "本名の名前のフリガナが全角（カタカナ）以外だと登録できない" do
      @user.first_name_kana = "1aAｱあ一"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "生年月日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end