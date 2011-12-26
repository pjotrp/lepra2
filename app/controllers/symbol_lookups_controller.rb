class SymbolLookupsController < ApplicationController
  # GET /symbol_lookups
  # GET /symbol_lookups.json
  def index
    @symbol_lookups = SymbolLookup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @symbol_lookups }
    end
  end

  # GET /symbol_lookups/1
  # GET /symbol_lookups/1.json
  def show
    @symbol_lookup = SymbolLookup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @symbol_lookup }
    end
  end

  # GET /symbol_lookups/new
  # GET /symbol_lookups/new.json
  def new
    @symbol_lookup = SymbolLookup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @symbol_lookup }
    end
  end

  # GET /symbol_lookups/1/edit
  def edit
    @symbol_lookup = SymbolLookup.find(params[:id])
  end

  # POST /symbol_lookups
  # POST /symbol_lookups.json
  def create
    @symbol_lookup = SymbolLookup.new(params[:symbol_lookup])

    respond_to do |format|
      if @symbol_lookup.save
        format.html { redirect_to @symbol_lookup, notice: 'Symbol lookup was successfully created.' }
        format.json { render json: @symbol_lookup, status: :created, location: @symbol_lookup }
      else
        format.html { render action: "new" }
        format.json { render json: @symbol_lookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /symbol_lookups/1
  # PUT /symbol_lookups/1.json
  def update
    @symbol_lookup = SymbolLookup.find(params[:id])

    respond_to do |format|
      if @symbol_lookup.update_attributes(params[:symbol_lookup])
        format.html { redirect_to @symbol_lookup, notice: 'Symbol lookup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @symbol_lookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symbol_lookups/1
  # DELETE /symbol_lookups/1.json
  def destroy
    @symbol_lookup = SymbolLookup.find(params[:id])
    @symbol_lookup.destroy

    respond_to do |format|
      format.html { redirect_to symbol_lookups_url }
      format.json { head :ok }
    end
  end
end
