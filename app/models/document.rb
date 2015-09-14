class Document < ActiveRecord::Base
  # Document
  # ID: Auto-increment reference
  # Name: Name of Document
  # Body: Text body of document
  validates_presence_of :title, :body

  has_many :keyword_taggings, dependent: :destroy
  has_many :keywords, through: :keyword_taggings

  has_many :concept_taggings, dependent: :destroy
  has_many :concepts, through: :concept_taggings

  after_create :tag_document
  after_update :tag_document, :if => :body_changed?

  def tag_document
    @tagger = TaggingService.new(self)
    @tagger.tag_keywords
    @tagger.tag_concepts
  end
end
