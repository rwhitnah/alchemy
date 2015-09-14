class Concept < ActiveRecord::Base
  #{"text"=>"Colorado"}
  validates :text, presence: true, uniqueness: {case_sensitive: false}

  has_many :concept_taggings, dependent: :destroy
  has_many :documents, through: :concept_taggings
end
