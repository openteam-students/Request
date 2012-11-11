class RequestaController < ApplicationController
  # GET /requesta
  # GET /requesta.json
  def index
    @requesta = Requestum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requesta }
    end
  end

  # GET /requesta/1
  # GET /requesta/1.json
  def show
    @requestum = Requestum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requestum }
    end
  end

  # GET /requesta/new
  # GET /requesta/new.json
  def new
    @requestum = Requestum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requestum }
    end
  end

  # GET /requesta/1/edit
  def edit
    @requestum = Requestum.find(params[:id])
  end

  # POST /requesta
  # POST /requesta.json
  def create
    @requestum = Requestum.new(params[:requestum])

    respond_to do |format|
      if @requestum.save
        format.html { redirect_to @requestum, notice: 'Requestum was successfully created.' }
        format.json { render json: @requestum, status: :created, location: @requestum }
      else
        format.html { render action: "new" }
        format.json { render json: @requestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requesta/1
  # PUT /requesta/1.json
  def update
    @requestum = Requestum.find(params[:id])

    respond_to do |format|
      if @requestum.update_attributes(params[:requestum])
        format.html { redirect_to @requestum, notice: 'Requestum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requesta/1
  # DELETE /requesta/1.json
  def destroy
    @requestum = Requestum.find(params[:id])
    @requestum.destroy

    respond_to do |format|
      format.html { redirect_to requesta_url }
      format.json { head :no_content }
    end
  end
end
