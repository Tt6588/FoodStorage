# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comment モデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { comment.valid? }

    let(:user) { create(:user) }
    let(:food) { create(:food, user_id: user.id) }
    let!(:comment) { build(:comment, food_id: food.id) }

    context 'comment カラム' do
      it '空欄は不可であること' do
        comment.comment = ''
        is_expected.to eq false
      end
      it '300文字以下であること、300文字は可' do
        comment.comment = Faker::Lorem.characters(number: 300)
        is_expected.to eq true
      end
      it '300文字以下であること、301文字以上は不可' do
        comment.comment = Faker::Lorem.characters(number: 301)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'foodモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:food).macro).to eq :belongs_to
      end
    end
  end
end