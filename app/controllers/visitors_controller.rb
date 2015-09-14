class VisitorsController < ApplicationController
  def index
    @document = Document.find(1)
    @document.tag_document
    # @document = Document.create(title: 'Demo Text', body: 'Yesterday dumb Bob destroyed my fancy iPhone in beautiful Denver, Colorado. I guess I will have to head over to the Apple Store and buy a new one.')
    # @tagger = TaggingService.new(@document)
    # @tagger.tag_keywords

    @keywords = @document.keywords
  end
end
