class ConceptTagging < ActiveRecord::Base
  validates_presence_of :relevance

  # Enforces uniqueness of Concept/Document pair
  validates_uniqueness_of :concept_id, scope: :document_id

  belongs_to :concept
  belongs_to :document
end
