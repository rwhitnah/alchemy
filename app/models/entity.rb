class Entity < ActiveRecord::Base
  #{"text"=>"Colorado"}
  validates_presence_of :text, :entity_type

  has_many :entity_taggings, dependent: :destroy
  has_many :documents, through: :entity_taggings
end
