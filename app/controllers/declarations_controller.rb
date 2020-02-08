class DeclarationsController < ApplicationController
  before_action :set_declaration, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @declarations = Declaration.all
  end

  def show
  end

  def score
    @declarations = Declaration.includes(:user)
  end

  def new
    @declaration = Declaration.new
  end

  def edit
  end

  def create
    @declaration = Declaration.new(declaration_params)

    respond_to do |format|
      if @declaration.save
        format.html { redirect_to new_declaration_path, notice: '記録しました。次のアクションを入力してください。' }
        format.json { render :show, status: :created, location: @declaration }
      else
        format.html { render :new }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @declaration.update(declaration_params)
        format.html { redirect_to @declaration, notice: '' }
        format.json { render :show, status: :ok, location: @declaration }
      else
        format.html { render :edit }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @declaration = Declaration.all
    @declaration.destroy_all
    respond_to do |format|
      format.html { redirect_to declarations_url, notice: 'お疲れ様でした。全ての記録を消去しました。' }
      format.json { head :no_content }
    end
  end

  private
    def set_declaration
      @declaration = Declaration.find(params[:id])
    end

    def declaration_params
      params.require(:declaration).permit(:what, :why, :time, :score, :start, :end).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
  end
