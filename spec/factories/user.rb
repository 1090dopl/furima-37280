FactoryBot.define do
  factory :user do
    nickname        {'test'}
    email           {'test@example'}
    password        {'00000000'}
    password_confirmation {password}
  end
end