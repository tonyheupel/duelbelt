class TrapsController < ApplicationController
  # GET /traps
  # GET /traps.json
  def index
    @traps = Trap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @traps }
    end
  end

  # GET /traps/1
  # GET /traps/1.json
  def show
    @trap = Trap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trap }
    end
  end

  # GET /traps/new
  # GET /traps/new.json
  def new
    @trap = Trap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trap }
    end
  end

  # GET /traps/1/edit
  def edit
    @trap = Trap.find(params[:id])
  end

  # POST /traps
  # POST /traps.json
  def create
    
    #effects = params[:trap].delete(:trap_effects)
    @trap = Trap.new(params[:trap])
    
    #@trap.trap_effects.concat(effects.map { |effect| @trap.trap_effects.build({ name: effect }) })
    #raise @trap.inspect
    respond_to do |format|
      if @trap.save
        format.html { redirect_to @trap, notice: 'Trap was successfully created.' }
        format.json { render json: @trap, status: :created, location: @trap }
      else
        format.html { render action: "new" }
        format.json { render json: @trap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /traps/1
  # PUT /traps/1.json
  def update
    @trap = Trap.find(params[:id])

    respond_to do |format|
      if @trap.update_attributes(params[:trap])
        format.html { redirect_to @trap, notice: 'Trap was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @trap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traps/1
  # DELETE /traps/1.json
  def destroy
    @trap = Trap.find(params[:id])
    @trap.destroy

    respond_to do |format|
      format.html { redirect_to traps_url }
      format.json { head :ok }
    end
  end
end
