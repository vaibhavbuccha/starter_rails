class SubjectController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
  end

  def new
  end

  def create
  end

  def show
    @subjects = Subject.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
