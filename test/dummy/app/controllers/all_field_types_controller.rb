class AllFieldTypesController < ApplicationController
  # GET /all_field_types
  # GET /all_field_types.json
  def index
    @all_field_types = AllFieldType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all_field_types }
    end
  end

  # GET /all_field_types/1
  # GET /all_field_types/1.json
  def show
    @all_field_type = AllFieldType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @all_field_type }
    end
  end

  # GET /all_field_types/new
  # GET /all_field_types/new.json
  def new
    @all_field_type = AllFieldType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @all_field_type }
    end
  end

  # GET /all_field_types/1/edit
  def edit
    @all_field_type = AllFieldType.find(params[:id])
  end

  # POST /all_field_types
  # POST /all_field_types.json
  def create
    @all_field_type = AllFieldType.new(params[:all_field_type])

    respond_to do |format|
      if @all_field_type.save
        format.html { redirect_to @all_field_type, notice: 'All field type was successfully created.' }
        format.json { render json: @all_field_type, status: :created, location: @all_field_type }
      else
        format.html { render action: "new" }
        format.json { render json: @all_field_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /all_field_types/1
  # PUT /all_field_types/1.json
  def update
    @all_field_type = AllFieldType.find(params[:id])

    respond_to do |format|
      if @all_field_type.update_attributes(params[:all_field_type])
        format.html { redirect_to @all_field_type, notice: 'All field type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @all_field_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_field_types/1
  # DELETE /all_field_types/1.json
  def destroy
    @all_field_type = AllFieldType.find(params[:id])
    @all_field_type.destroy

    respond_to do |format|
      format.html { redirect_to all_field_types_url }
      format.json { head :no_content }
    end
  end
end
