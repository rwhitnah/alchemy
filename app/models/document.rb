class Document < ActiveRecord::Base
  # Document
  # ID: Auto-increment reference
  # Name: Name of Document
  # Body: Text body of document

  validates_presence_of :name, :body

  has_many :keyword_taggings
  has_many :keywords, through: :keyword_taggings
end
