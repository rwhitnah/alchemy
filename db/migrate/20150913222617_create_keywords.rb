class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :text
    end
  end
end
