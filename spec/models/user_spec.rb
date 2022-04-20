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
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@が含まれていなければ登録できない' do
        @user.email='sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
       it 'first_nameが空では登録できない' do
        @user.first_name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
       end
      it 'last_nameが空では登録できない' do
        @user.last_name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email=@user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "1234a"
        @user.password_confirmation="1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password(確認含む）が半角英数字でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation='123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
        it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
          @user.last_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
          @user.first_name = 'rikutaro'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
        it 'first_name_kanaのフリガナは全角（カタカナ)でなければ登録できない' do
          @user.first_name_kana='陸太郎'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'last_name_kanaのフリガナは全角（カタカナ)でなければ登録できない' do
         @user.last_name_kana='山田'
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana=''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana=''
        @user.valid?
        expect(@user.errors.full_messages). to include("Last name kana can't be blank")
      end
        it 'passwordは確認も含めて2回入力しないと登録できない' do
          @user.password = ''
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
      end
    end
  end