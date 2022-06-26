require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @user = FactoryBot.build(:user)
    end

 describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it '全ての入力事項が存在すれば登録できる' do
        expect(@user).to be_valid
      end
        it 'パスワードが6文字以上半角英数であれば登録できる' do
          @user.password='123abc'
          @user.password_confirmation='123abc'
          expect(@user).to be_valid
        end
       it 'last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
          @user.last_name='山田'
          expect(@user).to be_valid
       end

        it 'first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
          @user.first_name = '陸太郎'
          expect(@user).to be_valid
        end
        it 'last_name_kanaのフリガナが全角（カタカナ）であれば登録できる' do
          @user.last_name_kana = 'ヤマダ'
          expect(@user).to be_valid
        end
        it 'first_name_kanaのフリガナが全角（カタカナ）であれば登録できる' do
          @user.first_name_kana = 'リクタロウ'
          expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは@が含まれていなければ登録できない' do
        @user.email='sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
       it 'first_nameが空では登録できない' do
        @user.first_name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
       end
      it 'last_nameが空では登録できない' do
        @user.last_name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it '重複したemailが存在する場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email=@user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）を入力してください")
      end
      
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "1234a"
        @user.password_confirmation="1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードとパスワード（確認用）は6文字以上で入力してください")
      end
      it 'password(確認含む）が半角英数字でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation='123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordは半角英字のみでは登録できない' do
       @user.password='abcdef'
       @user.password_confirmation='abcdef'
       @user.valid?
       expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

      it 'passwordは半角数字のみでは登録できない' do
       @user.password='123456'
       @user.password_confirmation='123456'
       @user.valid?
       expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '12345ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password='ああああああ'
        @user.password_confirmation='ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
        it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
          @user.last_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include('苗字は不正な値です')
        end
        it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
          @user.first_name = 'rikutaro'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前は不正な値です')
        end
        it 'first_name_kanaのフリガナは全角（カタカナ)でなければ登録できない' do
          @user.first_name_kana='陸太郎'
          @user.valid?
          expect(@user.errors.full_messages).to include("名前カナは不正な値です")
      end
      it 'last_name_kanaのフリガナは全角（カタカナ)でなければ登録できない' do
         @user.last_name_kana='山田'
         @user.valid?
         expect(@user.errors.full_messages).to include("苗字カナは不正な値です")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana=''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana=''
        @user.valid?
        expect(@user.errors.full_messages). to include("苗字カナを入力してください")
      end
        it 'passwordは確認も含めて2回入力しないと登録できない' do
          @user.password = ''
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end
      end
    end
  end