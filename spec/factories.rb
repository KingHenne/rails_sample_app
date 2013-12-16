FactoryGirl.define do
  factory :user do
    name     "Hendrik Liebau"
    email    "hendrik@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
