class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    @bet = Bet.new
	@games_w1 = Game.find(:all, :conditions => { :week => 1 })
	/@tip_index = 1/
	@bet_week = Time.now.strftime("%U").to_i
  end

  # GET /bets/1/edit
  def edit
    @games_w1 = Game.find(:all, :conditions => { :week => 1 })
	@bet = Bet.find(params[:id])
	@bet_week = @bet.created_at.strftime("%U").to_i
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)

    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bet }
      else
        format.html { render action: 'new' }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:user_id, :week, :hits, :tip1, :tip2, :tip3, :tip4, :tip5, :tip6, :tip7, :tip8, :tip9, :tip10, :tip11, :tip12, :tip13, :tip14, :tip15)
    end
end
