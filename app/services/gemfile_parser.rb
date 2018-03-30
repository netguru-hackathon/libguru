class GemfileParser
  def initialize(lockfile)
    @lockfile = lockfile
  end

  def call
    read_dependencies
  end

  private

  attr_reader :lockfile

  def read_dependencies
    Bundler::LockfileParser.new(lockfile).dependencies.keys
  end
end
