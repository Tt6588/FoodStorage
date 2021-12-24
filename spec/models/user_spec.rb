require 'rails_helper'
RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let(:user) { create(:user) }
    let!(:other_user) { create(:user) }

    context 'name カラム' do
      it '空欄は不可であること' do
        user.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること、1文字以下は不可' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること、2文字は可' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '15文字以下であること、15文字は可' do
        user.name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること、16文字以上は不可' do
        user.name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
      it '一意性があること' do
        user.name = other_user.name
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Foodモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:foods).macro).to eq :has_many
      end
    end
  end
end