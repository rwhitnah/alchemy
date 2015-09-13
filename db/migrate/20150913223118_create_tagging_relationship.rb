class CreateTaggingRelationship < ActiveRecord::Migration
  def change
    add_reference :keyword_taggings, :keyword, index: true
    add_foreign_key :keyword_taggings, :keywords

    add_reference :keyword_taggings, :document, index: true
    add_foreign_key :keyword_taggings, :documents
  end
end
