class RemarksController < ApplicationController
  # GET /remarks
  # GET /remarks.json
  def index
    @remarks = Remark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @remarks }
    end
  end

  # GET /remarks/1
  # GET /remarks/1.json
  def show
    @remark = Remark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @remark }
    end
  end

  # GET /remarks/new
  # GET /remarks/new.json
  def new
    @remark = Remark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @remark }
    end
  end

  # GET /remarks/1/edit
  def edit
    @remark = Remark.find(params[:id])
  end

  # POST /remarks
  # POST /remarks.json
  def create
    @remark = Remark.new(params[:remark])

    respond_to do |format|
      if @remark.save
        format.html { redirect_to @remark, notice: 'Remark was successfully created.' }
        format.json { render json: @remark, status: :created, location: @remark }
      else
        format.html { render action: "new" }
        format.json { render json: @remark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /remarks/1
  # PUT /remarks/1.json
  def update
    @remark = Remark.find(params[:id])

    respond_to do |format|
      if @remark.update_attributes(params[:remark])
        format.html { redirect_to @remark, notice: 'Remark was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @remark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remarks/1
  # DELETE /remarks/1.json
  def destroy
    @remark = Remark.find(params[:id])
    @remark.destroy

    respond_to do |format|
      format.html { redirect_to remarks_url }
      format.json { head :ok }
    end
  end
end
