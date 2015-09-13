require 'alchemyapi_ruby/alchemyapi'

module AlchemyClient
  def self.client
    @client ||= AlchemyAPI.new(Figaro.env.ALCHEMY_API_KEY)
  end
end
