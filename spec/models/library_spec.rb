# frozen_string_literal: true

RSpec.describe Library, type: :model do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:url).of_type(:string) }
  it { should have_db_column(:info).of_type(:text) }
  it { should have_db_column(:dependencies_count).of_type(:integer) }

  it { should have_many(:dependencies).dependent(:destroy) }
  it { should have_many(:repositories).through(:dependencies) }

  it { should validate_presence_of(:name) }
end

