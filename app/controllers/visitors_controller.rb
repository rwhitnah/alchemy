class VisitorsController < ApplicationController
  def index
    demo_text = 'Yesterday dumb Bob destroyed my fancy iPhone in beautiful Denver, Colorado. I guess I will have to head over to the Apple Store and buy a new one.'
    @response = AlchemyClient.client.keywords('text', demo_text, { 'keywordExtractMode'=>'strict', 'sentiment'=>0 })
  end
end
