class KeywordTagging < ActiveRecord::Base
  validates_presence_of :relevance

  belongs_to :keyword
  belongs_to :document
end
