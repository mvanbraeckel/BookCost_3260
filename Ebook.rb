#!/use/bin/ruby

# Course: CIS*3260: Software Design IV | Quiz 1: Question 6 - Book Cost Calculation
# Name: Mitchell Van Braeckel
# Student Number: 1002297
# Email: mvanbrae@uoguelph.ca
# Due Date: October 22, 2021
# Professor: Mark Wineberg
# Language: Ruby

"""
A Book should have:
- a title
- a price

If a book is a hard copy, it should have the title and price, as well as:
- a 'store_location'
    - which will hold one fo the following values
        - :Local
        - :Interprovincial
- the shipping cost

If the book is an e-book, it should have the title and price, as well as:
- a URL

There are two types of taxes -- Federal and Provincial
- the federal tax rate is 5%
- the provincial tax rate is 8%

To calculate the cost of the book, the following rules apply:
- the total cost of the book is the book price + shipping cost + applicable taxes
- both federal and provincial taxes applied to the book price
- e-books do not have shipping costs
- books shipped locally have both provincial and federal taxes applied to the shipping
- books shipped interprovincially only have federal taxes applied to the shipping
- books shipped internationally do not have taxes applied to the shipping

Notes on Grading:
- The code will not be run
- Minor errors will result in 2.5/3 for Ruby syntax
- Major errors will result in 2/3, 1/3, or 0/3 depending on how 'garbled' the code is
- OO Design will be evaluated based on:
    - effective use of inheritance
    - effective use of polymorhpism
    - minimum of duplicated code
"""

require "./Book.rb"

class Ebook < Book
    # Accesor method that returns the URL of an ebook
    attr_reader :url

    # Default constructor that creates an ebook based on provided arguments
    def initialize(title, price, url)
        super(title, price)
        raise ArgumentError, "URL '#{url}' is invalid - must be a string." unless url.is_a?(String)
        @url = url
    end
end
