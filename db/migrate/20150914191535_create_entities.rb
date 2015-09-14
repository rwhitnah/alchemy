class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :text
      t.string :type
    end

    create_table :entity_taggings do |t|
      t.float :relevance
    end
    
    add_reference :entity_taggings, :entity, index: true
    add_foreign_key :entity_taggings, :entities

    add_reference :entity_taggings, :document, index: true
    add_foreign_key :entity_taggings, :documents
  end
end
