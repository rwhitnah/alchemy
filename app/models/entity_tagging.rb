class EntityTagging < ActiveRecord::Base
  validates_presence_of :relevance

  # Enforces uniqueness of Entity/Document pair
  validates_uniqueness_of :entity_id, scope: :document_id

  belongs_to :entity
  belongs_to :document
end
