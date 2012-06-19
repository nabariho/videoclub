class CommentsController < ApplicationController
  before_filter :is_admin, :only =>[:index]
  before_filter :is_user, :except =>[:new, :create, :is_user]

  def index
    @film = Film.find(params[:film_id])
    @comments = @film.comments

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @film = Film.find(params[:film_id])
    @comment = @film.comments.create(params[:comment])
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @film, notice: 'Comment was successfully created.' }
      else
        flash[:error] = @comment.errors.full_messages
        format.html { redirect_to @film, notice: 'Comment has some errors.'}
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.film, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @film = @comment.film
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @film }
      format.json { head :no_content }
    end
  end

  def is_user
    unless user_signed_in? and (current_user.groups.find_by_name('admin') or (current_user == Comment.find(params[:id]).user) )
       raise AdminUserIsRequired
    end
  end
end
