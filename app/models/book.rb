# frozen_string_literal: true

class Book < ApplicationRecord
  validate :book_path_exist?

  def cache_markdowns
    chapters.each_with_index do |item, index|
      Rails.cache.write(:"#{cache_key_prefix}.#{index + 1}", item)
    end
  end

  def to_path_name
    I18n.transliterate(name).downcase.delete(' ')
  end

  def chapters
    chapter_paths.map { File.read(_1) }
  end

  def cache_keys
    keys = []
    key_num = 1

    loop do
      break if Rails.cache.read(:"#{cache_key_prefix}.#{key_num}").nil?

      keys << :"#{cache_key_prefix}.#{key_num}"
      key_num += 1
    end
    keys
  end

  private

  def cache_key_prefix
    "books.#{to_path_name}"
  end

  def chapter_paths
    Dir[book_path].select do
      _1.split('/').last.start_with('Bölüm', 'Önsöz', 'Part', 'Chapter')
    end
  end

  def book_path
    "#{Rails.root}/#{to_path_name}/"
  end

  def book_path_exist?
    errors.add(:book_path, "Markdown klasörü altında #{to_path_name} tanımlanmalıdır!") unless Dir.exist?(book_path)
  end
end
