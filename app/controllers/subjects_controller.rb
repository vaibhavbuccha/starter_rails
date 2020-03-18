class SubjectsController < ApplicationController
  
  layout false

  def index
    @subjects = Subject.sorted
  end

  def new
    @subject = Subject.new({:name=>"java",:position=>6})
  end 

  def create
    @subject = Subject.new(subject_Params)
    if @subject.save
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def show
    @subjects = Subject.find(params[:id])

  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_Params)
      redirect_to(subjects_path(@subject))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
  end

  def subject_Params
    params.required(:subject).permit(:name,:position,:visible)
  end

end
