class MonstersController < ApplicationController

  # GET /monsters
  # GET /monsters.json
  def index
    @monsters = Monster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @monsters }
    end
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
    @monster = Monster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monster }
    end
  end

  # GET /monsters/new
  # GET /monsters/new.json
  def new
    @monster = Monster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monster }
    end
  end

  # GET /monsters/1/edit
  def edit
    @monster = Monster.find(params[:id])
  end

  # POST /monsters
  # POST /monsters.json
  def create
    
    #effects = params[:monster].delete(:monster_effects)
    @monster = Monster.new(params[:monster])
    
    #@monster.monster_effects.concat(effects.map { |effect| @monster.monster_effects.build({ name: effect }) })
    #raise @monster.inspect
    respond_to do |format|
      if @monster.save
        format.html { redirect_to @monster, notice: 'Monster was successfully created.' }
        format.json { render json: @monster, status: :created, location: @monster }
      else
        format.html { render action: "new" }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @monster = Monster.find(params[:id])

    respond_to do |format|
      if @monster.update_attributes(params[:monster])
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @monster = Monster.find(params[:id])
    @monster.destroy

    respond_to do |format|
      format.html { redirect_to monsters_url }
      format.json { head :ok }
    end
  end

end
