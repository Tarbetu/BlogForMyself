# frozen_string_literal: true

# I wrote my books in Markdown,
# So I want to publish my books directly from a Markdown file.
# This model manages these markdown files
#
# Assume that we have an book named Hierarchy of Vulpo Noir
# First,
# you need to create directory in Rails.root/markdown directory named "hierarchyofvulponoir"
# This model will look the downcased, blankless and transliterated form of the name
# Example: #{Rails.root}/markdown/hierarchyofvulponoir
# Then,
# you should put markdown files in nested "book" directory in directory which you created
# #{Rails.root}/markdown/hierarchyofvulponoir/book/Chapter 1.md
# Finally,
# You can use cache_markdowns to move files then into Redis and chapter to get them
class Book < ApplicationRecord
  validate :book_path_exist?

  def self.find_by_path_name(path_name)
    all.select { |book| book.name.to_path_name == path_name }.first
  end

  def cache_markdowns
    return if Rails::Cache.read(:"#{cache_key_prefix}.content")

    chapters.each_with_index do |item, index|
      Rails::Cache.write(:"#{cache_key_prefix}.#{index}", item)
    end
    collect_keys
  end

  def to_path_name
    path_name = I18n.transliterate(name).downcase
    path_name.delete(' ')
    path_name
  end

  def chapters
    chapter_paths.map { File.read(_1) }
  end

  def chapter(chapter_number = nil)
    if chapter_number.nil? ||
       Rails::Cache.read("#{cache_key_prefix}.content.length") - 1 < chapter_number
      chapter_number = 0
    end

    Rails::Cache.read(:"#{cache_key_prefix}.#{chapter_number}")
  end

  private

  def collect_keys
    keys = []
    key_num = 0

    loop do
      break unless chapter(key_num)

      keys << :"#{cache_key_prefix}.#{key_num}"
      key_num += 1
    end

    content_key = :"#{cache_key_prefix}.content"
    Rails::Cache.write(content_key, keys)
    Rails::Cache.write("#{content_key}.length", keys.length)
    content_key
  end

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
