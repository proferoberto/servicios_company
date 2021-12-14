class EmpleadosController < ApplicationController
  before_action :set_empleado, only: %i[ show edit update destroy ]
  before_action :get_sede

  # GET /empleados or /empleados.json
  def index
    @empleados = @sede.empleados
  end

  # GET /empleados/1 or /empleados/1.json
  def show
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new
  end

  # GET /empleados/1/edit
  def edit
  end

  # POST /empleados or /empleados.json
  def create
    @sede = Sede.find_by(id: params[:sede_id])
    @empleado = Empleado.new(empleado_params)
    @empleado.sede_id = params[:sede_id]
    respond_to do |format|
      if @empleado.save
        format.html { redirect_to sede_empleado_path(@sede, @empleado), notice: "Empleado was successfully created." }
        format.json { render :show, status: :created, location: @empleado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleados/1 or /empleados/1.json
  def update
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html { redirect_to @empleado, notice: "Empleado was successfully updated." }
        format.json { render :show, status: :ok, location: @empleado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empleados/1 or /empleados/1.json
  def destroy
    @empleado.destroy
    respond_to do |format|
      format.html { redirect_to empleados_url, notice: "Empleado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    def get_sede
      @sede = Sede.find(params[:sede_id])
    end

    # Only allow a list of trusted parameters through.
    def empleado_params
      params.require(:empleado).permit(:nombre, :apellido, :edad, :email, :sede_id)
    end
end
