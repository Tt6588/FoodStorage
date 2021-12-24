# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'foodモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { food.valid? }

    let(:user) { create(:user) }
    let!(:food) { build(:food, user_id: user.id) }

    context 'food_name カラム' do
      it '空欄は不可であること' do
        food.food_name = ''
        is_expected.to eq false
      end
    end
    context 'detail カラム' do
      it '空欄は不可であること' do
        food.detail = ''
        is_expected.to eq false
      end
    end
    context 'genre カラム' do
      it '空欄は不可であること' do
        food.genre = ''
        is_expected.to eq false
      end
    end
    context 'quantity カラム' do
      it '空欄は不可であること' do
        food.quantity = ''
        is_expected.to eq false
      end
    end
    context 'deadline_time カラム' do
      it '空欄は不可であること' do
        food.deadline_time = ''
        is_expected.to eq false
      end
    end

    context 'food_name カラム' do
      it '15文字以下であること、15文字は可' do
        food.food_name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること、16文字以上は不可' do
        food.food_name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end
    context 'detail カラム' do
      it '300文字以下であること、300文字は可' do
        food.detail = Faker::Lorem.characters(number: 300)
        is_expected.to eq true
      end
    end
    context 'detail カラム' do
      it '300文字以下であること、301文字以上は不可' do
        food.detail = Faker::Lorem.characters(number: 301)
        is_expected.to eq false
      end
    end
    context 'genre カラム' do
      it '15文字以下であること、15文字は可' do
        food.genre = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
    end
    context 'genre カラム' do
      it '15文字以下であること、16文字以上は不可' do
        food.genre = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Food.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end