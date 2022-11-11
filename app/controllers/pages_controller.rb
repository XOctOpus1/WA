class PagesController < ApplicationController
#     in the library, for each reader ordering a book, a card is filled out: surname, date order, date of issue of the book. 
# Determine: 1) the shortest period for which the book was found; 2)how many orders were not satisfied; 3) who most often takes books; 4) which book is the most popular 5 ) how many people ordered books included in the top three in terms of popularity .
    #inizialize Book Reader and Order
    class Book
        attr_accessor :name, :author, :year, :genre
        def initialize(name, author, year, genre)
            @name = name
            @author = author
            @year = year
            @genre = genre
        end


    end
    
    class Reader
        attr_accessor :name, :surname, :patronymic, :id
        def initialize(name, surname, patronymic, id)
            @name = name
            @surname = surname
            @patronymic = patronymic
            @id = id
        end
    
            
    end

    class Order
        attr_accessor :book, :reader, :date_order, :date_issue
        def initialize(book, reader, date_order, date_issue)
            @book = book
            @reader = reader
            @date_order = date_order
            @date_issue = date_issue
        end
    end
    #make all method
    def all
        #make all books
        book1 = Book.new("Harry Potter", "J.K.Rowling", 1997, "fantasy")
        book2 = Book.new("Lord of the Rings", "J.R.R.Tolkien", 1954, "fantasy")
        book3 = Book.new("The Hobbit", "J.R.R.Tolkien", 1937, "fantasy")

        #make all readers
        reader1 = Reader.new("Ivan", "Ivanov", "Ivanovich", 1)
        reader2 = Reader.new("Petr", "Petrov", "Petrovich", 2)
        reader3 = Reader.new("Sidor", "Sidorov", "Sidorovich", 3)

        #make all orders
        order1 = Order.new(book1, reader1, "01.01.2018", "01.01.2018")
        order2 = Order.new(book2, reader2, "02.01.2018", "02.01.2018")
        order3 = Order.new(book3, reader3, "03.01.2018", "03.01.2018")

        #make array of books
        books = [book1, book2, book3]
        #make array of readers
        readers = [reader1, reader2, reader3]
        #make array of orders
        orders = [order1, order2, order3]

    end

        
    def index
        @books = all.books
        @readers = all.readers
        @orders = all.orders

        
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to @book
        else
            render 'edit'
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :genre, :year)
    end


end


