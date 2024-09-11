class CompetitionsController < ApplicationController
  before_action :set_competition, only: %i[ show edit update destroy remove_tag add_tag]

  # GET /competitions or /competitions.json
  def index
    @competitions = Competition.all
  end

  def search
    @search = params["query"]
    @age = params["age"].to_i
    @tags = params["tags"]
    @competitions = Competition.all
    @competitions = @competitions.text_search(@search) if @search
    @competitions = @competitions.valid_age(@age) if @age > 0
    if @tags != nil and @tags != [""] and @tags != []
      @competitions = @competitions.joins(:competition_tags).where(competition_tags: { id: @tags.filter{|tag| tag != ""} }).distinct
    end

  end

  def about
  end

  # GET /competitions/1 or /competitions/1.json
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions or /competitions.json
  def create
    @competition = Competition.new(competition_params)
    respond_to do |format|
      if @competition.save
        format.html { redirect_to competition_url(@competition), notice: "Competition was successfully created." }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1 or /competitions/1.json
  def update
    puts "======================================="
    puts competition_params
    puts "======================================="
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to competition_url(@competition), notice: "Competition was successfully updated." }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1 or /competitions/1.json
  def destroy
    @competition.destroy!

    respond_to do |format|
      format.html { redirect_to competitions_url, notice: "Competition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_tag
    tag = CompetitionTag.find(params[:competition_tag_id])
    @competition.competition_tags -= [tag]
    redirect_to @competition, notice: "Tag was successfully removed."
  end

  def add_tag
    tag = CompetitionTag.find(params[:competition_tag_id])
    @competition.competition_tags << tag
    redirect_to @competition, notice: "Tag was successfully added."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competition_params
      params.require(:competition).permit(:name, :description, :topic, :age_from, :age_to, competition_tag_ids: [])
    end
end
