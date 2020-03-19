class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def new
    @page = Page.new
    @pages = Page.sorted
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully...."
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
    @pages = Page.sorted
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully...."
      redirect_to(pages_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' deleted successfully.... "
    redirect_to(pages_path)
  end

  def page_params
    params.required(:page).permit(:name,:position,:permalink,:visible,:subject_id)
  end
end
