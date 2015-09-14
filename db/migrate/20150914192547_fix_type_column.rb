class FixTypeColumn < ActiveRecord::Migration
  def change
    rename_column :entities, :type, :entity_type
  end
end
