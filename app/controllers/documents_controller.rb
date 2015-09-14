class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def edit
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.create(document_params)
    render 'show'
  end

  def update
    @document = Document.find(params[:id])
    @document.update(document_params)
    render 'show'
  end

  private

  def document_params
    params.require(:document).permit(:id, :title, :body)
  end
end
