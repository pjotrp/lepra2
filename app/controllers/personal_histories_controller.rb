class PersonalHistoriesController < ApplicationController
  # GET /personal_histories
  # GET /personal_histories.json
  def index
    @personal_histories = PersonalHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_histories }
    end
  end

  # GET /personal_histories/1
  # GET /personal_histories/1.json
  def show
    @personal_history = PersonalHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_history }
    end
  end

  # GET /personal_histories/new
  # GET /personal_histories/new.json
  def new
    @personal_history = PersonalHistory.new
    if params[:copy_id]
      # find the previous history
      hist = PersonalHistory.find(params[:copy_id])
      # make sure the display fields exist
      @personal_history = 
        PersonalHistory.create( 
          :registration => hist.registration, 
          :registration_date => hist.registration_date,
          :staff_id => hist.staff_id,
          :date => Time.now )
      new_id = @personal_history.id
      if hist
        @personal_history = hist.clone
        @personal_history.id = new_id

        @personal_history.date = Time.now
        @personal_history.remark = 'copied from previous form'
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_history }
    end
  end

  # GET /personal_histories/1/edit
  def edit
    @personal_history = PersonalHistory.find(params[:id])
  end

  # POST /personal_histories
  # POST /personal_histories.json
  def create
    @personal_history = PersonalHistory.new(params[:personal_history])

    respond_to do |format|
      if @personal_history.save
        format.html { redirect_to @personal_history, notice: 'Personal history was successfully created.' }
        format.json { render json: @personal_history, status: :created, location: @personal_history }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_histories/1
  # PUT /personal_histories/1.json
  def update
    @personal_history = PersonalHistory.find(params[:id])

    respond_to do |format|
      if @personal_history.update_attributes(params[:personal_history])
        format.html { redirect_to @personal_history, notice: 'Personal history was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @personal_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_histories/1
  # DELETE /personal_histories/1.json
  def destroy
    @personal_history = PersonalHistory.find(params[:id])
    @personal_history.destroy

    respond_to do |format|
      format.html { redirect_to personal_histories_url }
      format.json { head :ok }
    end
  end
end
