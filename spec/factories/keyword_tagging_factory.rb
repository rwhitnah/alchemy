FactoryGirl.define do
  factory :keyword_tagging do
    relevance 0.904227
    document_id { rand(100) }
    keyword_id { rand(100) }
  end
end
