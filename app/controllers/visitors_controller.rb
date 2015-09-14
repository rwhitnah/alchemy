class VisitorsController < ApplicationController
  def index
    @document = Document.find(1)
    @document.tag_document

    @keywords = @document.keywords
  end
end
