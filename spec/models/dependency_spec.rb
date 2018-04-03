# frozen_string_literal: true

describe Dependency, type: :model do
  before(:each) { @dependency = FactoryBot.create(:dependency) }
  subject { @dependency }

  it { should have_db_column(:repository_id).of_type(:integer) }
  it { should have_db_column(:library_id).of_type(:integer) }

  it { should have_db_index(:repository_id) }
  it { should have_db_index(:library_id) }

  it { should belong_to(:library).counter_cache(true) }
  it { should belong_to(:repository) }

  it { should validate_presence_of(:library) }
  it { should validate_uniqueness_of(:library).scoped_to(:repository_id) }
  it { should validate_presence_of(:repository) }
end
