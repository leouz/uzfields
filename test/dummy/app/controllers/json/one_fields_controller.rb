class Json::OneFieldsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    respond_with OneField.all    
  end

  def show
    respond_with OneField.find(params[:id])
  end

  def create
    OneField.create(params[:one_field])
    render :nothing => true
  end

  def update
    m = OneField.find(params[:id])
    m.update_attributes(params[:one_field])
    respond_with m.save
  end

  def destroy
    respond_with OneField.destroy(params[:id])
  end
end