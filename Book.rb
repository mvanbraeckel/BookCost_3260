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

class Book
    # Constants declared for tax rates
    FEDERAL_TAX_RATE = 0.05
    PROVINCIAL_TAX_RATE = 0.08

    # Accesor method that returns the title of the book
    # Accesor method that returns the price of the book
    attr_reader :title, :price

    # Default constructor that creates a generic book with given title and price
    def initialize(title, price)
        raise ArgumentError, "Title '#{title}' is invalid - must be a string." unless title.is_a?(String)
        @title = title
        raise ArgumentError, "Price '#{price}' is invalid - must be at least a value of 0.00" unless (price.is_a?(Integer) || price.is_a?(Float)) && price >= 0.00
        @price = price
    end

    # Returns the federal tax rate associated with the cost of a book
    def federal_tax_rate
        FEDERAL_TAX_RATE
    end

    # Returns the provincial tax rate associated with the cost of a book
    def provincial_tax_rate
        PROVINCIAL_TAX_RATE
    end

    # Calculates and returns the cost of the book after applicable taxes
    def calculate_cost
        @price * (1 + self.federal_tax_rate + self.provincial_tax_rate)
    end
end
