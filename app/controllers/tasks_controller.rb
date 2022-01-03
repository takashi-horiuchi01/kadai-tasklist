class TasksController < ApplicationController
  def index
    @messages = Task.all
  end

  def show
    @message = Task.find(params[:id])
  end

  def new
    @message = Task.new
  end

  def create
    @message = Task.new(message_params)

    if @message.save
      flash[:success] = 'タスク が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'タスク が投稿されませんでした'
      render :new
    end
  end

  def edit
    @message = Task.find(params[:id])
  end

  def update
    @message = Task.find(params[:id])

    if @message.update(message_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @message = Task.find(params[:id])
    @message.destroy

    flash[:success] = 'タスク は正常に削除されました'
    redirect_to tasks_url
  end

  private

  # Strong Parameter
  def message_params
    params.require(:task).permit(:content)
  end

end
