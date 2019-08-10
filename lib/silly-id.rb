# frozen_string_literal: true

require 'silly-id/version'
require 'securerandom'
require 'i18n'

module SillyId
  class << self
    def haiku(token_range = 9999, delimiter = '-')
      build_haiku(token_range, delimiter)
    end

    private

    def build_haiku(token_range, delimiter)
      sections = [
        adjectives[random_seed % adjectives.length],
        nouns[random_seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range.positive?
    end

    def supported_locales
      @supported_locales ||= begin
        Dir.glob('lib/silly-id/words/*').map do |path|
          path.split('/').last.chomp('.txt').split('_').first
        end.uniq.sort
      end
    end

    def locale_supported?(locale)
      supported_locales.include?(locale.to_s)
    end

    def locale
      locale_supported?(I18n.locale) ? I18n.locale : :en
    end

    def adjectives
      File.read(File.expand_path("../silly-id/words/#{locale}_adjectives.txt", __FILE__)).split("\n")
    end

    def nouns
      File.read(File.expand_path("../silly-id/words/#{locale}_nouns.txt", __FILE__)).split("\n")
    end
  end
end
