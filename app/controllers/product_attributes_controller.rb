class ProductAttributesController < ApplicationController
  # GET /product_attributes
  # GET /product_attributes.json
  def index
    @product_attributes = ProductAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_attributes }
    end
  end

  # GET /product_attributes/1
  # GET /product_attributes/1.json
  def show
    @product_attribute = ProductAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_attribute }
    end
  end

  # GET /product_attributes/new
  # GET /product_attributes/new.json
  def new
    @product_attribute = ProductAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_attribute }
    end
  end

  # GET /product_attributes/1/edit
  def edit
    @product_attribute = ProductAttribute.find(params[:id])
  end

  # POST /product_attributes
  # POST /product_attributes.json
  def create
    @product_attribute = ProductAttribute.new(params[:product_attribute])

    respond_to do |format|
      if @product_attribute.save
        format.html { redirect_to @product_attribute, notice: 'Product attribute was successfully created.' }
        format.json { render json: @product_attribute, status: :created, location: @product_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @product_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_attributes/1
  # PUT /product_attributes/1.json
  def update
    @product_attribute = ProductAttribute.find(params[:id])

    respond_to do |format|
      if @product_attribute.update_attributes(params[:product_attribute])
        format.html { redirect_to @product_attribute, notice: 'Product attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_attributes/1
  # DELETE /product_attributes/1.json
  def destroy
    @product_attribute = ProductAttribute.find(params[:id])
    @product_attribute.destroy

    respond_to do |format|
      format.html { redirect_to product_attributes_url }
      format.json { head :no_content }
    end
  end
end
