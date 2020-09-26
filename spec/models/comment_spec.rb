require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user)}

  context '内容が入力されている場合' do
    let!(:comment) { create(:comment, article: article) }

    it 'コメントを保存できる' do
      expect(comment).to be_valid
    end
  end

  context '内容が入力されていない場合' do
    let!(:comment) { build(:comment, content: Faker::Lorem.characters(number: 0), article: article) }

    before do
      comment.save
    end

    it 'コメントが保存できない' do
      expect(comment.errors.messages[:content][0]).to eq('を入力してください')
    end
  end
end
