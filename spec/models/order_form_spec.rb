require 'rails_helper'

RSpec.describe OrderForm, type: :model do
    before do
      @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できない' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号はハイフンがないと保存できない' do
        @order_form.post_code = 123_1234
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code ハイフンを含めてください")
      end
      it '都道府県の情報が空だと保存できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村の情報が空だと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地の情報が空だと保存できない' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号の情報が空だと保存できない' do
        @order_form.phone_numder = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone numder can't be blank")  
      end
      it '電話番号は10桁以下だと保存できない' do
        @order_form.phone_numder = 123456789
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone numder 無効です")
      end  
      it '電話番号は12桁以上だと保存できない' do
        @order_form.phone_numder = 123456789101
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone numder 無効です")
      end
      it '電話番号は全角の場合は保存できない' do
        @order_form.phone_numder = '０９０１２３４１２３４'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone numder 無効です")
      end 
      it 'tokenが空では登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end 

