require 'rails_helper'

describe User do
  describe '#create' do
    it "nameカラム、emailカラム、passwordカラムに入力があれば、ユーザー登録ができる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameカラムに入力なしで、ユーザーの登録がでない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailカラムに入力なしで、ユーザーの登録ができない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordカラムに入力なしで、ユーザーの登録ができない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "重複したメールアドレスは登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordカラムは存在しても、password_confirmationカラムが存在しないと登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end
