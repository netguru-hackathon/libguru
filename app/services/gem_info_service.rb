class GemInfoService

  include HTTParty
  base_uri "rubygems.org/api/v1/gems"

  def self.call(gem)
    response = get("/#{gem}.json")
  end

end
