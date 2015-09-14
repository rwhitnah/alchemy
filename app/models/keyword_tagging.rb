class KeywordTagging < ActiveRecord::Base
  # Notes for future features:
  # * This would be an excellent model to cache account_ids or similar for fast queries scoped to organization
  #   without needing to join on the (much larger) document objects
  
  # "keywords"=>[{"relevance"=>"0.983037", "text"=>"fancy iPhone"}
  # Stores relevance to help with ranking/ordering of search results
  validates_presence_of :relevance

  # Enforces uniqueness of Keword/Document pair
  validates_uniqueness_of :keyword_id, scope: :document_id

  belongs_to :keyword
  belongs_to :document
end
