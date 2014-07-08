require 'rails_helper'

describe User do
  describe 'attributes' do
    it 'should have an email db column' do
      expect(subject).to have_db_column(:email).of_type :string
    end

    it 'should have an crypted_password db column' do
      expect(subject).to have_db_column(:crypted_password).of_type :string
    end

    it 'should have an password_salt db column' do
      expect(subject).to have_db_column(:password_salt).of_type :string
    end

    it 'should have an persistence_token db column' do
      expect(subject).to have_db_column(:persistence_token).of_type :string
    end

    it 'should have an created_at db column' do
      expect(subject).to have_db_column(:created_at).of_type :datetime
    end

    it 'should have an updated_at db column' do
      expect(subject).to have_db_column(:updated_at).of_type :datetime
    end
  end

  describe 'validations' do
    it 'should validate the format of the email' do
      expect(subject).to allow_value('somebody@somewhere.com').for :email
      expect(subject).to allow_value('somebody.jones@somewhere.somewhereelse.com').for :email
      expect(subject).not_to allow_value('somebody.jones@com').for :email
      expect(subject).not_to allow_value('somebody.jonessomewhere.com').for :email
    end

    context "when creating a new user" do
      subject { User.new email: 'somebody@somewhere.com' }

      it 'should require a password of at least 4 characters' do
        expect(subject).to ensure_length_of(:password).is_at_least(4)
      end

      it 'should ensure the password and confirmation match' do
        u = subject
        u.password = 'password'
        u.password = 'notthesamepassword'
        expect(u).not_to be_valid
        expect(u.errors['password_confirmation']).not_to be_empty
      end
    end
  end
end
