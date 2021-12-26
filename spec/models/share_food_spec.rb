# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'share_foodモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { share_food.valid? }

    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:group_user) { create(:group_user, user: user, group: group) }
    let!(:share_food) { create(:share_food, group_id: group.id) }


    context 'food_name カラム' do
      it '空欄は不可であること' do
        share_food.food_name = ''
        is_expected.to eq false
      end
      it '15文字以下であること、15文字は可' do
        share_food.food_name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること、16文字以上は不可' do
        share_food.food_name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end

    context 'detail カラム' do
      it '空欄は不可であること' do
        share_food.detail = ''
        is_expected.to eq false
      end
      it '300文字以下であること、300文字は可' do
        share_food.detail = Faker::Lorem.characters(number: 300)
        is_expected.to eq true
      end
      it '300文字以下であること、301文字以上は不可' do
        share_food.detail = Faker::Lorem.characters(number: 301)
        is_expected.to eq false
      end
    end

    context 'genre カラム' do
      it '空欄は不可であること' do
        share_food.genre = ''
        is_expected.to eq false
      end
      it '15文字以下であること、15文字は可' do
        share_food.genre = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること、16文字以上は不可' do
        share_food.genre = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end

    context 'quantity カラム' do
      it '空欄は不可であること' do
        share_food.quantity = ''
        is_expected.to eq false
      end
    end

    context 'deadline_time カラム' do
      it '空欄は不可であること' do
        share_food.deadline_time = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'groupモデルとの関係' do
      it 'N:1となっている' do
        expect(ShareFood.reflect_on_association(:group).macro).to eq :belongs_to
      end
    end
    context 'ShareCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(ShareFood.reflect_on_association(:share_comments).macro).to eq :has_many
      end
    end
  end
end