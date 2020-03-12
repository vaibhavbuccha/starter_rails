class HomeController < ApplicationController
  layout false
  def index

    # render contact view 
    render('index')

  end

  def contact

    # @ => indicated the instance variables
    @name = ['vaibhav','mayur','lakshit','krishna','ravi']
    # render contact view 
    render('contact')

  end

  def home
    
    # render view of another controller
    redirect_to(:controller => 'home', :action => 'contact')
    
  end

  def youtube
    redirect_to( 'https://youtube.com' )
  end

end
