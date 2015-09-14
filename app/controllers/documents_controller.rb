class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  # def edit
  #   @document = Document.find(params[:id])
  # end

  # def update

  # end

  # def new
  #   @document = Document.new
  # end

  # def create
  # end
end
