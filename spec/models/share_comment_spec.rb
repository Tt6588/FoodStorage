# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ShareComment モデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { share_comment.valid? }

    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:group_user) { create(:group_user, user: user, group: group) }
    let(:share_food) { create(:share_food, group_id: group.id) }
    let!(:share_comment) { build(:share_comment, group_id: group.id, share_food_id: share_food.id) }

    context 'share_comment カラム' do
      it '空欄は不可であること' do
        share_comment.comment = ''
        is_expected.to eq false
      end
      it '300文字以下であること、300文字は可' do
        share_comment.comment = Faker::Lorem.characters(number: 300)
        is_expected.to eq true
      end
      it '300文字以下であること、301文字以上は不可' do
        share_comment.comment = Faker::Lorem.characters(number: 301)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'groupモデルとの関係' do
      it 'N:1となっている' do
        expect(ShareComment.reflect_on_association(:group).macro).to eq :belongs_to
      end
    end
    context 'share_foodモデルとの関係' do
      it 'N:1となっている' do
        expect(ShareComment.reflect_on_association(:share_food).macro).to eq :belongs_to
      end
    end
  end
end