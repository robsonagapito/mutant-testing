describe Library do
  subject(:library) { Library.new }

  let(:book) { Book.new(1,'Livro teste') }
  let(:add_book) {library.add_book(book)}


  context '#add_book' do
  	it 'return complete library after add book' do
	    expect(add_book).to be(library)
	  end

	  it 'add book to library and validate addition' do
	    add_book
	    expect(library.books).to include(book)
			expect(library.index[book.number].number).to eq(book.number)
			expect(library.index[book.number].title).to eq(book.title)
	  end

	end

	context '#exists_book?' do
		before {add_book}

	  it 'add book and returns true to valid book' do
	  	expect(library.exists_book?(book.number)).to be true
	  end

	  it 'add book and returns false to invalid book' do
	  	expect(library.exists_book?(book.number+2)).to be false
	  end

	end

	context '#book' do
		before {add_book}

		let (:book_nil) {Book.new(nil,nil)}

	  it 'Search by not exist book' do
	  	val_res = book.number+1
	  	expect{library.book(val_res)}.to raise_error(RuntimeError, /Library does not have a book with number:#{val_res.to_s}/)
	  end

	  it 'Search by exist book' do
	  	expect(library.book(book.number)).to be(book)
	  end
	end

end





