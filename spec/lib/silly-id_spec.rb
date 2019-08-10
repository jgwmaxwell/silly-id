# frozen_string_literal: true

require_relative '../spec_helper'

describe SillyId do
  it 'generates a name like still-silence-5012' do
    name = SillyId.haiku

    expect(name).to match(/\A\w+-\w+-\d{1,4}\z/)
  end

  it "won't return the same name for subsequent calls" do
    name1 = SillyId.haiku
    name2 = SillyId.haiku

    expect(name1).not_to eql(name2)
  end

  it 'permits optional configuration of the token range' do
    name = SillyId.haiku(9)

    expect(name).to match(/-\d{1}\z/)
  end

  it 'drops the token if token range is 0' do
    name = SillyId.haiku(0)

    expect(name).to match(/\A\w+-\w+\z/)
  end

  it 'permits optional configuration of the delimiter' do
    name = SillyId.haiku(9999, '.')

    expect(name).to match(/\A\w+\.\w+\.\d{1,4}\z/)
  end

  it 'drops the token and delimiter if token range is 0 and delimiter empty space' do
    name = SillyId.haiku(0, ' ')

    expect(name).to match(/\A\w+ \w+\z/)
  end

  context 'private' do
    describe '#supported_locales' do
      it 'returns a list of supported locales' do
        expect(SillyId.send(:supported_locales)).to eq(%w[en nl])
      end
    end

    describe '#locale' do
      it 'defaults to :en' do
        expect(SillyId.send(:locale)).to eq(:en)
      end

      it 'supports :nl' do
        allow(I18n).to receive(:locale).and_return(:nl)
        expect(SillyId.send(:locale)).to eq(:nl)
      end

      it 'defaults to :en when unsupported locale' do
        allow(I18n).to receive(:locale).and_return(:pl)
        expect(SillyId.send(:locale)).to eq(:en)
      end
    end
  end
end
