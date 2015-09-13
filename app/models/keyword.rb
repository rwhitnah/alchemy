class Keyword < ActiveRecord::Base
  #{"text"=>"Colorado"}
  validates_presence_of :text
end
