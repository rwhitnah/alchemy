class CreateKeywordTaggings < ActiveRecord::Migration
  def change
    create_table :keyword_taggings do |t|
      t.float :relevance
    end
  end
end
