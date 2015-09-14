class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :text
    end

    create_table :concept_taggings do |t|
      t.float :relevance
    end
    
    add_reference :concept_taggings, :concept, index: true
    add_foreign_key :concept_taggings, :concepts

    add_reference :concept_taggings, :document, index: true
    add_foreign_key :concept_taggings, :documents
  end
end
