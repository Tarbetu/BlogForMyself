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

  def chapter(chapter_number = 0)
    Rails.cache.read(:"#{cache_key_prefix}.#{chapter_number}")
  end

  def collect_keys
    keys = []
    key_num = 0

    loop do
      break if Rails.cache.read(:"#{cache_key_prefix}.#{key_num}").nil?

      keys << :"#{cache_key_prefix}.#{key_num}"
      key_num += 1
    end

    Rails.cache.write(:"#{cache_key_prefix}.content", keys)
    keys.length
  end

  private

  def cache_key_prefix
    "books.#{to_path_name}"
  end

  def chapter_paths
    chapters = Dir[book_path].map(&:downsize)
    chapter.unshift(chapter.delete('önsöz.md')) # moves preface to head
    chapters.compact
  end

  def book_path
    "#{Rails.root}/#{to_path_name}/book"
  end

  def book_path_exist?
    errors.add(:book_path, "Markdown klasörü altında #{to_path_name} tanımlanmalıdır!") unless Dir.exist?(book_path)
  end
end
