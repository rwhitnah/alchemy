class Keyword < ActiveRecord::Base
  #{"text"=>"Colorado"}
  validates :text, presence: true, uniqueness: {case_sensitive: false}

  has_many :keyword_taggings, dependent: :destroy
  has_many :documents, through: :keyword_taggings
end
