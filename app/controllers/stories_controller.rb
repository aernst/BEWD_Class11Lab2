class StoriesController < ApplicationController
  #before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Storie.search_for(params[:q])   
    #@stories = Storie.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    # @story = Storie.all
    @story = Storie.find(params[:id])
  end

  # GET /stories/new
  def new
    @story = Storie.new
  end

  # GET /stories/1/edit
  def edit
    @story = Storie.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Storie.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Storie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    
    @storie = Storie.find(params[:id])
    @storie.update story_params
    redirect_to @storie


    # respond_to do |format|
    #   if @story.update(story_params)
    #     format.html { redirect_to @story, notice: 'Storie was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @story.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @storie = Storie.find(params[:id])
    @storie.destroy
    redirect_to stories_path :notice => "Success!"  

    # @story.destroy
    # respond_to do |format|
    #   format.html { redirect_to stories_url }
    #   format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Storie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
       params.require(:storie).permit(:title, :link, :upvotes, :category)
     # params.require(:story).permit(:title, :link, :upvotes, :category)
    end
end
