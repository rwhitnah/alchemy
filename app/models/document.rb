class Document < ActiveRecord::Base
  # Document
  # ID: Auto-increment reference
  # Name: Name of Document
  # Body: Text body of document

  validates_presence_of :name, :body
  
end
