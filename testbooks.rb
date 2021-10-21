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

# My personal testing file script used for simple print tests

require "./Book.rb"
require "./HardCopy.rb"
require "./Ebook.rb"

# ========================= BOOK =========================
puts "------------------------- Book.rb -------------------------"

b = Book.new("Adventures of the King", 1.00)
# r.reset
puts "after init:\ttitle=#{b.title}\tprice=#{b.price}\tfed_tax_rate=#{b.federal_tax_rate}\tprov_tax_rate=#{b.provincial_tax_rate}\tcalc_cost=#{b.calculate_cost.round(2)}"

# ======================= HARD COPY =======================
puts "----------------------- HardCopy.rb -----------------------"

# HardCopy::STORE_LOCATIONS.sample
h = HardCopy.new("Hard Lessons", 1, :Local, 1.00)
puts "after init:\ttitle=#{h.title}\tprice=#{h.price}\tstore_location=#{h.store_location}\t\tshipping_cost=#{h.shipping_cost}\tcalc_ship_cost=#{h.calculate_shipping_cost.round(2)}\tcalc_cost=#{h.calculate_cost.round(2)}"

h = HardCopy.new("Hardy War History", 1, :Interprovincial, 1.00)
puts "after init:\ttitle=#{h.title}\tprice=#{h.price}\tstore_location=#{h.store_location}\tshipping_cost=#{h.shipping_cost}\tcalc_ship_cost=#{h.calculate_shipping_cost.round(2)}\tcalc_cost=#{h.calculate_cost.round(2)}"

# ========================= EBOOK =========================
puts "------------------------ Ebook.rb ------------------------"

e = Ebook.new("E-Reading Delight 101", 10.0, "https://getrektbywineberg.com/CIS3260-in-a-nutshell")
puts "after init:\ttitle=#{e.title}\tprice=#{e.price}\turl=#{e.url}\tcalc_cost=#{e.calculate_cost.round(2)}"
