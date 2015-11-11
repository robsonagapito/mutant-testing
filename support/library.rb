class Book # < Struct.new(:number, :title)
  attr_accessor :number, :title

  def initialize (book_number, book_title)
    @number = book_number
    @title = book_title
  end

end

class Library
  attr_reader :books

  def initialize
    @books = []
    @index = {}
  end

  def book(number)
    @index.fetch(number) {
      raise "Library does not have a book with number:" + number.to_s
    }
  end

  def add_book(book)
    @books << book
    @index[book.number] = book
    self
  end

  def exists_book?(number)
    (@index.fetch(number) { "Livro existe" }) != "Livro existe"
    # true
  end

  def index
    @index
  end
end
