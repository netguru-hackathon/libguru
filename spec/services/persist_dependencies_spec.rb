# frozen_string_literal: true

describe PersistDependencies do
  subject { PersistDependencies.call(libraries, repository) }
  let(:library) { FactoryBot.create(:library) }
  let(:library2) { FactoryBot.create(:library) }
  let(:repository) { FactoryBot.create(:repository) }
  let(:libraries) { [library, library2] }

  context "persisting" do
    it "creates new dependencies" do
      result = subject
      expect(Dependency.count).to eq 2
    end

    it "does not duplicate dependencies" do
      result = subject
      PersistDependencies.call(libraries, repository)
      expect(Dependency.count).to eq 2
    end
  end

  context "output" do
    it "returns correct dependencies" do
      result = subject
      expect(result.success?).to eq true
      expect(result.value.first.id).to eq library.id
    end
  end
end
