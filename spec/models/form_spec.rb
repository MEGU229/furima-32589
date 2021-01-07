require 'rails_helper'
describe  Form do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)

  end

  describe '商品購入' do

    context '商品購入がうまくいくとき' do

      it "建物名はあってもなくてもどちらでも可。建物名以外の各項目を正しく入力すれば購入できる" do
        expect(@form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do

      it "post_codeが空だと購入できない" do
        @form.post_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code can't be blank")
      end

      it "post_codeに『-』がないと購入できない" do
        @form.post_code = 1234567
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "post_codeの『-』の位置が『123-4567』でないと購入できない" do
        @form.post_code = 12-12345
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "post_codeが7桁でないと購入できない" do
        @form.post_code = 123-456
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "cityが空だと購入できない" do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空だと購入できない" do
        @form.house_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("House number can't be blank")
      end

      it "telが空だと購入できない" do
        @form.tel = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel can't be blank")
      end

      it "telに『-』があると購入できない" do
        @form.tel = 012-3456-7890
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel is invalid")
      end

      it "telが12桁以上だと購入できない" do
        @form.tel = 123456789012
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel is invalid")
      end

      it "tokenが空では購入できない" do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end