# frozen_string_literal: true
require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) { @user = FactoryBot.create(:user) }
  subject { @user }

  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:provider).of_type(:string) }
  it { should have_db_column(:uid).of_type(:string) }
  it { should have_db_column(:role).of_type(:integer) }

  it { should define_enum_for(:role).with([:user, :vip, :admin]) }
end
