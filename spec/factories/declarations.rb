FactoryBot.define do
  factory :declaration do
    what { '勉強' }
    why { 'エンジニアになるため' }
    time { '３時間' }
    score { '03:00:00' }
    user_id { 1 }
    start { '15:00' }
  end
end
