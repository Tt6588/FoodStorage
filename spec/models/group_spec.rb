# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'groupモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { group.valid? }

    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let!(:group_user) { create(:group_user, user: user, group: group) }
    let(:other_group) { create(:group) }
    let!(:other_group_user) { create(:group_user, user: user, group: group) }

    context 'name カラム' do
      it '空欄は不可であること' do
        group.name = ''
        is_expected.to eq false
      end
      it '9文字以下であること、9文字は可' do
        group.name = Faker::Lorem.characters(number: 9)
        is_expected.to eq true
      end
      it '9文字以下であること、10文字以上は不可' do
        group.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq false
      end
      it '一意性があること' do
        group.name = other_group.name
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Group.reflect_on_association(:users).macro).to eq :has_many
      end
    end
    context 'Group_Usersモデルとの関係' do
      it '1:Nとなっている' do
        expect(Group.reflect_on_association(:group_users).macro).to eq :has_many
      end
    end
    context 'Share_Foodsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Group.reflect_on_association(:share_foods).macro).to eq :has_many
      end
    end
    context 'Share_Commentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Group.reflect_on_association(:share_comments).macro).to eq :has_many
      end
    end
  end
end