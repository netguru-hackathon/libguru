# frozen_string_literal: true

describe GemfileParser do
  subject { GemfileParser.new(lockfile).call }
  let(:lockfile_path) { Rails.root.join("spec", "fixtures", "files", "example_gemfile.lock") }
  let(:lockfile) { File.read(lockfile_path) }

  it "returns a list of gems" do
    is_expected.to include("octokit", "rails", "rubocop")
  end
end
