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
    all.select { |book| (book.path_name) == path_name }.first
  end

  def chapter_url(chapter_number)
    link_to "/#{book}/#{chapter_number}"
  end

  def cache_markdowns
    return if Rails.cache.read(:"#{cache_key_prefix}.content")

    chapters.each_with_index do |item, index|
      Rails.cache.write(:"#{cache_key_prefix}.#{index}", item)
    end
    collect_keys
  end

  def path_name
    I18n.transliterate(name).downcase.delete(' ')
  end

  def chapter(chapter_number = nil)
    chapter_number ||= 0

    if Rails.env.development?
      chapters[chapter_number.to_i]
    else
      Rails.cache.read(:"#{cache_key_prefix}.#{chapter_number}")
    end
  end

  def chapters_length
    if Rails.env.development?
      chapters.length
    else
      Rails.cache.read(:"#{cache_key_prefix}.content.length")
    end
  end

  private

  def chapters
    chapter_paths.map { File.read(_1) }
  end

  def collect_keys
    keys = []
    key_num = 0

    loop do
      break unless chapter(key_num)

      keys << :"#{cache_key_prefix}.#{key_num}"
      key_num += 1
    end

    content_key = :"#{cache_key_prefix}.content"
    Rails.cache.write(content_key, keys)
    Rails.cache.write("#{content_key}.length", keys.length)
    content_key
  end

  def cache_key_prefix
    "books.#{path_name}"
  end

  def chapter_paths
    Dir[book_path]
  end

  def book_path
    "#{Rails.root}/markdown/#{path_name}/book/*"
  end

  def book_path_exist?
    return if Dir.exist?(book_path)

    errors.add(:book_path,
               %(Markdown klasörü altında #{path_name} ve onun da altında 'book' tanımlanmalıdır!
      Aranan dizin: #{book_path}))
  end
end
