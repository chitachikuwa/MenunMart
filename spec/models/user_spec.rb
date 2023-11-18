require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   end
  
   describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "last_name,first_nameとkana_last_name,kana_first_nameとemail、passwordとpassword_confirmation存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "Yamada"  
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は不正な値です")
      end
      it "first_nameが空では登録できない" do 
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "Hanako"  
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "kana_last_nameが空では登録できない" do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
      end
      it "kana_last_nameがカタカナ以外では登録できない" do
        @user.kana_last_name = "山田"
        @user.valid?
       expect(@user.errors.full_messages).to include('姓（カナ）は不正な値です')
      end
      it "kana_first_nameが空では登録できない" do 
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it "kana_first_nameがカタカナ以外では登録できない" do
        @user.kana_first_name = "花子"
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("アドレスを入力してください")
      end
      it  "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("アドレスはすでに存在します")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('アドレスは不正な値です')
      end 
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '1234j'
        @user.password_confirmation = '1234j'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it  "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = '123kkk'
        @user.password_confirmation = '123kkkk'
        @user.valid?("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが半角英字のみの場合は登録できない" do
        @user.password = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
       it "passwordが数字のみの場合は登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが全角では登録できない" do
        @user.password = "ｐａｓｓｗｏｒｄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end 
     end
    end
  end
 

