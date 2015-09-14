class SearchService
  def initialize(query)
    @query = query
    @query_keywords = tag_keywords
    @query_concepts = tag_concepts
    @query_entities = tag_entities
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
        keywords << { text: k['text'], relevance: k['relevance'].to_f }
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
        concepts << { text: c['text'], relevance: c['relevance'].to_f }
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
        entities << { text: e['text'], entity_type: e['type'], relevance: e['relevance'].to_f }
      end

      return entities
    else
      raise ActiveRecord::StatementInvalid
    end
  end

  def search_all
    results = []
    results += search_keywords
    results += search_concepts
    results += search_entities

    results
  end

  def search_keywords
    results = []
    @query_keywords.each do |q|
      keywords = Keyword.where(text: q[:text])
      # Multiply relevances together to approximate query relevance to document
      keywords.each do |k|
        k.keyword_taggings_taggings.each do |t|
          results << {keyword_id: k.id, document_id: t.document_id, relevance: (q[:relevance]*t.relevance)}
        end
      end
    end
    results.sort! {|a,b| b[:relevance] <=> a[:relevance]}
    results
  end

  def search_concepts
    results = []
    @query_concepts.each do |c|
      concepts = Concept.where(text: c[:text])
      # Multiply relevances together to approximate query relevance to document
      concepts.each do |k|
        k.concept_taggings.each do |t|
          results << {concept_id: k.id, document_id: t.document_id, relevance: (c[:relevance]*t.relevance)}
        end
      end
    end
    results.sort! {|a,b| b[:relevance] <=> a[:relevance]}
    results
  end

  def search_entities
    results = []
    @query_entities.each do |q|
      entities = Entity.where(text: q[:text]).where(entity_type: q[:entity_type])
      # Multiply relevances together to approximate query relevance to document
      entities.each do |e|
        e.entity_taggings.each do |t|
          results << {entity_id: e.id, document_id: t.document_id, relevance: (q[:relevance]*t.relevance)}
        end
      end
    end
    results.sort! {|a,b| b[:relevance] <=> a[:relevance]}
    results
  end
end
