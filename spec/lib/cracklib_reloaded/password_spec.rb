# frozen_string_literal: true

require 'spec_helper'
require './lib/cracklib_reloaded/password'

describe CracklibReloaded::Password do
  let(:cracklib_reloaded) { described_class.new }
  let(:strong_password) { '_#(FsĘ8=\'d*d}\"Ął' }
  let(:weak_password) { 'admin' }

  describe '.new' do
    context 'given nothing' do
      it 'sets default cracklib dictionary path' do
        expect(cracklib_reloaded.instance_variable_get(:@dict_path)).to be
      end
    end
    context 'given the cracklib dictionary path as an argument' do
      let(:dict_path) { '/tmp/foo/bar' }
      let(:cracklib_reloaded) { described_class.new(dict_path) }

      it 'sets provided path' do
        expect(cracklib_reloaded.instance_variable_get(:@dict_path)).to equal(dict_path)
      end
    end
  end

  describe '#weak?' do
    context 'given a weak password string' do
      it 'returns true' do
        expect(cracklib_reloaded.weak?(weak_password)).to be_truthy
      end
    end
    context 'given a strong password string' do
      it 'returns false' do
        expect(cracklib_reloaded.weak?(strong_password)).to be_falsy
      end
    end
  end

  describe '#errors' do
    context 'given a weak password string' do
      before { cracklib_reloaded.weak?(weak_password) }

      it 'contains iterable collection' do
        expect(cracklib_reloaded.errors).to respond_to(:each)
      end

      it 'contains hash with :password key' do
        expect(cracklib_reloaded.errors.to_h).to include(:password)
      end

      it 'contains hash with an array under :password key' do
        expect(cracklib_reloaded.errors.to_h[:password]).to be_kind_of(Array)
      end

      it 'contains hash with an array under :password key containing a proper message string' do
        expect(cracklib_reloaded.errors.to_h[:password].first.to_s).to match(/short/)
      end
    end
    context 'given a strong password string' do
      before { cracklib_reloaded.weak?(strong_password) }

      it 'contains no errors' do
        expect(cracklib_reloaded.errors).to be_empty
      end
    end
  end
end
