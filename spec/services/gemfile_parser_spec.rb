# frozen_string_literal: true

describe GemfileParser do
  subject { GemfileParser.new(lockfile).call }
  let(:lockfile) { File.read(Bundler.default_lockfile) }

  it "returns a list of gems" do
    is_expected.to include("octokit", "rails", "rubocop")
  end
end
