class Subject < ApplicationRecord

    # defind scope :visible is the name of the variable and it perform the work which is written in {} 
    scope :visible, lambda {where(:visible => true)}
    # we use it like subject.visible
    scope :invisible, lambda {where(:visible => false)}
    scope :sorted, lambda {order("position ASC")}
    scope :search, lambda {|query| where(["name LIKE ?","%#{query}%"])}


end
