class Json::OneImageFieldsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    respond_with OneImageField.all    
  end

  def show
    respond_with OneImageField.find(params[:id])
  end

  def create
    OneImageField.create(params[:one_image_field])
    render :nothing => true
  end

  def update    
    m = OneImageField.find(params[:id])
    m.update_attributes(params[:one_image_field])
    respond_with m.save
  end

  def destroy
    respond_with OneImageField.destroy(params[:id])
  end
end