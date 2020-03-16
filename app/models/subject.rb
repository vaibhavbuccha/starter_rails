class Subject < ApplicationRecord

    # has_one shows it is an one to one relation with page
    # has_one :page
    # has_many indicates one to many relationships
    has_many :pages

    # defind scope :visible is the name of the variable and it perform the work which is written in {} 
    scope :visible, lambda {where(:visible => true)}
    # we use it like subject.visible
    scope :invisible, lambda {where(:visible => false)}
    scope :sorted, lambda {order("position ASC")}
    scope :search, lambda {|query| where(["name LIKE ?","%#{query}%"])}
    

end
