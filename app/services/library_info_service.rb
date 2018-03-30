class LibraryInfoService

  include HTTParty
  base_uri "rubygems.org/api/v1/gems"

  def self.call(library)
    response = get("/#{library}.json")
    JSON.parse(response.to_s)
  end

end
