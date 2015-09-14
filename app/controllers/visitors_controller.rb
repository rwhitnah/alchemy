class VisitorsController < ApplicationController
  def index
    @documents = []
    @query = ''

    if params[:query]
      @query = params[:query]
      search_service = SearchService.new(@query)
      results = search_service.search_all
      results.each do |result|
        @documents << Document.find(result[:document_id])
        @documents.compact!
        @documents.uniq!
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @documents }
    end
  end
end
