FactoryBot.define do
  factory :employee do
    email { 'employee@gmail.com' }
    password { 'password' }
    role { 'employee' }

    factory :hr do
      email {'hr@gmail.com'}
      role { 'hr' }
    end

    factory :manager do
      email {'manager@gmail.com'}
      role { 'manager' }
    end

  end
end
