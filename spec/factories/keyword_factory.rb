FactoryGirl.define do
  factory :keyword do
    sequence(:text) { |i| ['apple','banana','cranberry'][i%3] }
  end
end
