require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires a first_name' do
      u = User.new
      u.valid?
      expect(u.errors).to have_key(:first_name)
    end

    it 'requires a last_name' do
      u = User.new
      u.valid?
      expect(u.errors).to have_key(:last_name)
    end

    it 'requires a email' do
      u = User.new
      u.valid?
      expect(u.errors).to have_key(:email)
    end
  end
end
