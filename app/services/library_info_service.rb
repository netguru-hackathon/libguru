# Example response:
# {"name"=>"rails",
#  "downloads"=>126215899,
#  "version"=>"5.1.6",
#  "version_downloads"=>7132,
#  "platform"=>"ruby",
#  "authors"=>"David Heinemeier Hansson",
#  "info"=>"Ruby on Rails is a full-stack web framework optimized for programmer happiness and sustainable productivity. It encourages beautiful code by favoring convention over configuration.",
#  "licenses"=>["MIT"],
#  "metadata"=>{},
#  "sha"=>"b8301a87151de3feb7cbdf57a66842bb668493f4cec464fd0f67d4c7173b6051",
#  "project_uri"=>"https://rubygems.org/gems/rails",
#  "gem_uri"=>"https://rubygems.org/gems/rails-5.1.6.gem",
#  "homepage_uri"=>"http://rubyonrails.org",
#  "wiki_uri"=>"",
#  "documentation_uri"=>"http://api.rubyonrails.org",
#  "mailing_list_uri"=>"http://groups.google.com/group/rubyonrails-talk",
#  "source_code_uri"=>"http://github.com/rails/rails",
#  "bug_tracker_uri"=>"http://github.com/rails/rails/issues",
#  "changelog_uri"=>nil,
#  "dependencies"=>
#   {"development"=>[],
#    "runtime"=>
#     [{"name"=>"actioncable", "requirements"=>"= 5.1.6"},
#      {"name"=>"actionmailer", "requirements"=>"= 5.1.6"},
#      {"name"=>"actionpack", "requirements"=>"= 5.1.6"},
#      {"name"=>"actionview", "requirements"=>"= 5.1.6"},
#      {"name"=>"activejob", "requirements"=>"= 5.1.6"},
#      {"name"=>"activemodel", "requirements"=>"= 5.1.6"},
#      {"name"=>"activerecord", "requirements"=>"= 5.1.6"},
#      {"name"=>"activesupport", "requirements"=>"= 5.1.6"},
#      {"name"=>"bundler", "requirements"=>">= 1.3.0"},
#      {"name"=>"railties", "requirements"=>"= 5.1.6"},
#      {"name"=>"sprockets-rails", "requirements"=>">= 2.0.0"}]}}

require 'oj'

class LibraryInfoService

  include HTTParty
  base_uri "rubygems.org/api/v1/gems"

  def self.call(library)
    response = get("/#{library}.json")
    Oj.load(response.to_s)
  end
end
