class SearchService
  def initialize(query)
    @query = query
    @keywords = tag_keywords
    @concepts = tag_concepts
    @entities = tag_entities
  end

  def tag_keywords
    # Keyword query on AlchemyAPI.
    # 'Strict' mode theoretically gives more specific keywords.
    # Sentiment analysis not used in current version, so is turned off.
    @response = AlchemyClient.client.keywords('text', @query, { 'keywordExtractMode'=>'strict', 'sentiment'=>0 })
    keywords = []
    # TODO: response.success?
    if @response['status'] == 'OK'
      @response['keywords'].each do |k|
        #build extracted keyword search terms
        keywords << { text: k['text'], relevance: k['relevance'] }
      end


      return keywords
    else
      raise ActiveRecord::StatementInvalid
    end
  end

  def tag_concepts
    # Concept query on AlchemyAPI.
    @response = AlchemyClient.client.concepts('text', @query)
    concepts = []

    # TODO: response.success?
    if @response['status'] == 'OK'
      @response['concepts'].each do |c|
        #build extracted concept search terms
        concepts << { text: c['text'], relevance: c['relevance'] }
      end

      return concepts
    else
      raise ActiveRecord::StatementInvalid
    end
  end

  def tag_entities
    # Concept query on AlchemyAPI.
    # Sentiment analysis not used in current version, so is turned off.
    @response = AlchemyClient.client.entities('text', @query, { 'sentiment'=>0 })
    entities = []

    # TODO: response.success?
    if @response['status'] == 'OK'
      @response['entities'].each do |e|
        #build extracted entity search terms
        entities << { text: e['text'], entity_type: e['type'], relevance: e['relevance'] }
      end

      return entities
    else
      raise ActiveRecord::StatementInvalid
    end
  end
end
