class SedesController < ApplicationController
  before_action :set_sede, only: %i[ show edit update destroy ]

  # GET /sedes or /sedes.json
  def index
    @sedes = Sede.all
  end

  # GET /sedes/1 or /sedes/1.json
  def show
  end

  # GET /sedes/new
  def new
    @sede = Sede.new
  end

  # GET /sedes/1/edit
  def edit
  end

  # POST /sedes or /sedes.json
  def create
    @sede = Sede.new(sede_params)

    respond_to do |format|
      if @sede.save
        format.html { redirect_to @sede, notice: "Sede was successfully created." }
        format.json { render :show, status: :created, location: @sede }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sedes/1 or /sedes/1.json
  def update
    respond_to do |format|
      if @sede.update(sede_params)
        format.html { redirect_to @sede, notice: "Sede was successfully updated." }
        format.json { render :show, status: :ok, location: @sede }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sedes/1 or /sedes/1.json
  def destroy
    @sede.destroy
    respond_to do |format|
      format.html { redirect_to sedes_url, notice: "Sede was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sede
      @sede = Sede.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sede_params
      params.require(:sede).permit(:nombre)
    end
end
