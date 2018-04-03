# frozen_string_literal: true

describe Repository, type: :model do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:url).of_type(:string) }

  it { should have_many(:dependencies).dependent(:destroy) }
  it { should have_many(:libraries).through(:dependencies) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
end
