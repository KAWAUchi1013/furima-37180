require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
       end
  describe "ユーザー新規登録" do
    context  "正常系"  do
        it"ユーザー新規登録ができる" do
          expect(@user).to be_valid
      end
     end
     context  "異常系"  do
      it"nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが必須であること。" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが一意性であること。" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "パスワードは、6文字以上での入力が必須であること" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password= "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "パスワードとパスワード（確認）は、値の一致が必須であること。" do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "emailは、@を含む必要があること" do
          @user.email = "testtest"
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "英字のみのパスワードでは登録できない" do
            @user.email = "aaaaaaa"
            @user.valid?
            expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "全角文字を含むパスワードでは登録できない" do
          @user.email = "AAAAAAA"
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "姓（全角）が空だと登録できない" do
        @user.surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname is invalid"
      end
      it "姓（全角）に半角文字が含まれていると登録できない" do
        @user.first_name_reading = "AAAaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading is invalid"
      end
      it "名（全角）が空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is invalid"
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.name = "AAAaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is invalid"
      end
      it "姓（カナ）が空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.name_reading = "tarouタロウ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name reading is invalid"
      end
      it "名（カナ）が空だと登録できない" do
        @user.surname = "taroutarou"
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname is invalid"
      end
      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_reading = "タロウ太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading is invalid"
      end
      it "・生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
   end 
end


