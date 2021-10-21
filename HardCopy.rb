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

class HardCopy < Book
    # Constant array of valid store locations for hard copy book
    STORE_LOCATIONS = [:Local, :Interprovincial]

    # Accesor method that returns the store location of the hard copy book
    # Accesor method that returns the base shipping cost of the hard copy book
    attr_reader :store_location, :shipping_cost

    # Default constructor that creates a hard copy book based on provided arguments
    def initialize(title, price, store_location, shipping_cost)
        super(title, price)
        raise ArgumentError, "Store Location '#{store_location}' is invalid - must be one of: #{STORE_LOCATIONS}" unless STORE_LOCATIONS.include?(store_location)
        @store_location = store_location
        raise ArgumentError, "Base shipping cost '#{shipping_cost}' is invalid - must be at least a value of 0.00" unless (shipping_cost.is_a?(Integer) || shipping_cost.is_a?(Float)) && shipping_cost >= 0.00
        @shipping_cost = shipping_cost
    end

    # Calculates and returns the total shipping cost based on book price and shipping distance (local/provincial vs interprovincial vs international) after applicable taxes
    def calculate_shipping_cost
        if @store_location == :Local
            @shipping_cost * (1 + self.federal_tax_rate + self.provincial_tax_rate)
        elsif @store_location == :Interprovincial
            @shipping_cost * (1 + self.federal_tax_rate)
        else
            # so store location is international
            @shipping_cost
        end
    end

    # Calculates and returns the total cost of the hard copy book adding additional shipping costs and their applicable taxes (rounded to 2 decimal places)
    def calculate_cost
        super + self.calculate_shipping_cost
    end
end
