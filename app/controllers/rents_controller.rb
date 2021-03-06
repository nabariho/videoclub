class RentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :only => [:index, :destroy]
  before_filter :is_user,  :except =>[:new, :create, :index]

  # GET /rents.json
  def index
    if params[:film_id]
      @rents=Film.find(params[:film_id]).rents
    elsif params[:user_id]
      @rents=User.find(params[:user_id]).rents
    else
      @rents = Rent.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rents }
    end
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
    @rent = Rent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/new
  # GET /rents/new.json
  def new
    @rent = Rent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/1/edit
  def edit
    @rent = Rent.find(params[:id])
  end

  # POST /rents
  # POST /rents.json
  def create
    @film = Film.find(params[:film_id])
    if current_user.cards.empty?
      redirect_to @film, :notice => 'No tiene tarjetas registradas' and return
    end
    @rent = @film.rents.find_by_user_id(current_user.id)
    if @rent #existe
      if params[:commit].include?("Alquila") #se desea alquilar
         if @rent.rent #era un alquiler
           @rent.start_date = Time.current()
           @rent.end_date = @rent.end_date + 3.days
           @rent.rent=true
         else #era una compra. NO puede alquilarse
            redirect_to @film, :notice => 'Pelicula ya comprada' and return
         end
      else #Se desea comprar
         if @rent.rent #era un alquiler
            @rent.start_date = Time.current()
            @rent.rent=false
         else #Era una compra
            redirect_to @film, :notice => 'Ya la tiene comprada' and return
         end
      end
    else #no existe
      @rent= @film.rents.create()
      @rent.user_id = current_user.id
      @rent.start_date = Time.current()
      if params[:commit].include?("Alquila")
        @rent.end_date = Time.current() + 3.days
        @rent.rent=true
      else
        @rent.rent=false
      end
    end
    @rent.save
    respond_to do |format|
      if @rent.save
        format.html { redirect_to @film, notice: 'Rent was successfully created.' }
        format.json { render json: @rent, status: :created, location: @rent }
      else
        format.html { render action: "new" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rents/1
  # PUT /rents/1.json
  def update
    @rent = Rent.find(params[:id])

    respond_to do |format|
      if @rent.update_attributes(params[:rent])
        format.html { redirect_to @rent, notice: 'Rent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to rents_path }
      format.json { head :no_content }
    end
  end

  def is_user
    unless current_user.groups.find_by_name('admin')  or (current_user == Rent.find(params[:id]).user)
       raise AdminUserIsRequired
    end
  end

end
