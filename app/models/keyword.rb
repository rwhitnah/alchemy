class Keyword < ActiveRecord::Base
  #{"text"=>"Colorado"}
  validates_presence_of :text

  has_many :keyword_taggings
  has_many :documents, through: :keyword_taggings
end
