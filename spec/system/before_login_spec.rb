require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'Aboutが表示される：1番目である' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match(/About/)
      end
      it 'sign upが表示される：2番目である' do
        signup_link = find_all('a')[2].native.inner_text
        expect(signup_link).to match(/sign up/)
      end
      it 'ログインが表示される：3番目である' do
        login_link = find_all('a')[3].native.inner_text
        expect(login_link).to match(/log in/)
      end
    end
  end
end