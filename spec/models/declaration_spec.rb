require 'rails_helper'

describe Declaration do
  describe '#create' do
    it '全てのカラムに入力があれば、記録登録ができる' do
      user = create(:user)
      time = user.declarations.build(what: '勉強', why: 'エンジニアになるため', time: '３時間', score: '03:00:00', user_id: 1, start: '15:00', end: '17:00')
      expect(time).to be_valid
    end

    it 'whatカラムに入力がないと、記録登録ができない' do
      time = build(:declaration, what: '', end: '17:00')
      time.valid?
      expect(time.errors[:what]).to include('を入力してください')
    end

    it 'whenカラムに入力がないと、記録登録ができない' do
      time = build(:declaration, why: '', end: '17:00')
      time.valid?
      expect(time.errors[:why]).to include('を入力してください')
    end

    it 'timeカラムに入力がないと、記録登録ができない' do
      time = build(:declaration, time: '', end: '17:00')
      time.valid?
      expect(time.errors[:time]).to include('を入力してください')
    end

    it 'scoreカラムに入力がないと、記録登録ができない' do
      time = build(:declaration, score: '', end: '17:00')
      time.valid?
      expect(time.errors[:score]).to include('を入力してください')
    end

    it 'user_idカラムに入力がないと、記録登録ができない' do
      time = build(:declaration, user_id: '', end: '17:00')
      time.valid?
      expect(time.errors[:user_id]).to include('を入力してください')
    end

    it 'startカラムに入力がないと、記録登録ができない' do
      time = build(:declaration, start: '', end: '17:00')
      time.valid?
      expect(time.errors[:start]).to include('を入力してください')
    end

    it 'endカラムに入力がないと、記録登録ができない' do
      time = build(:declaration)
      time.valid?
      expect(time.errors[:end]).to include('を入力してください')
    end
  end
end
