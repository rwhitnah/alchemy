class Concept < ActiveRecord::Base
  #{"text"=>"Colorado"}
  validates_presence_of :text

  has_many :concept_taggings, dependent: :destroy
  has_many :documents, through: :concept_taggings
end
