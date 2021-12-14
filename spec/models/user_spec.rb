require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '正常系' do
      it 'ユーザー新規登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '異常系' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワードには英字と数字の両方を含めて設定してください", "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'emailが必須であること。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'emailが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません", "パスワードには英字と数字の両方を含めて設定してください"
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'emailは、@を含む必要があること' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it '英字のみのパスワードでは登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.email = 'AAAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it '姓（全角）が空だと登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Surnameを入力してください", "Surnameは不正な値です"
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.name = 'AAAaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Nameは不正な値です"
      end
      it '名（全角）が空だと登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Surnameを入力してください", "Surnameは不正な値です"
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.surname = 'AAAaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Surnameは不正な値です"
      end
      it '姓（カナ）が空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nameを入力してください", "Nameは不正な値です"
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.name_reading = 'tarouタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name readingは不正な値です"
      end
      it '名（カナ）が空だと登録できない' do
        @user.name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name readingを入力してください", "Name readingは不正な値です"
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_reading = 'タロウ太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name readingは不正な値です"
      end
      it '・生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthdayを入力してください"
      end
    end
  end
end
