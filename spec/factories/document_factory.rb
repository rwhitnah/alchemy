FactoryGirl.define do
  factory :document do
    sequence(:title) { |i| "Document ##{i}" }
    body 'Yesterday dumb Bob destroyed my fancy iPhone in beautiful Denver, Colorado. I guess I will have to head over to the Apple Store and buy a new one.'
  
    trait :with_tagging do

      after(:create) do |document|
        keyword1 = FactoryGirl.create(:keyword,
          text: "fancy iPhone"
        )

        FactoryGirl.create(:keyword_tagging,
          relevance: 0.983037,
          document_id: document.id,
          keyword_id: keyword1.id
        )

        keyword2 = FactoryGirl.create(:keyword,
          text: "dumb Bob")

        FactoryGirl.create(:keyword_tagging,
          relevance: 0.904227,
          document_id: document.id,
          keyword_id: keyword2.id
        )

        # Sample data from API to use:
        # keywords"=>[{"relevance"=>"0.983037", "text"=>"fancy iPhone"}, 
        # {"relevance"=>"0.904227", "text"=>"dumb Bob"}, 
        # {"relevance"=>"0.835704", "text"=>"beautiful Denver"}, 
        # {"relevance"=>"0.721868", "text"=>"Apple Store"}, 
          # {"relevance"=>"0.38689", "text"=>"Colorado"}]}
      end
    end
  end
end
