class TaggingService
  def initialize(document)
    @document = document
  end

  def tag_keywords
    @response = AlchemyClient.client.keywords('text', @document.body, { 'keywordExtractMode'=>'strict', 'sentiment'=>0 })

    # TODO: response.success?
    if @response['status'] == 'OK'
      # If document has already been tagged (text changed/updated), clear out taggings for new copy
      @document.keyword_taggings.destroy_all
      @response['keywords'].each do |k|
        keyword = Keyword.where(text: k['text']).first_or_create
        KeywordTagging.create(relevance: k['relevance'].to_f, keyword: keyword, document: @document)
      end
    else
      raise ActiveRecord::StatementInvalid
    end
  end
end
