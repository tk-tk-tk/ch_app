class CommentsController < ApplicationController
  before_action :find_message
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @comments = @messages.comments.create(comment_params)
    @comments.user_id = current_user.id

    if @comments.save
      redirect_to message_path(@messages)
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @comments.destroy
    redirect_to message_path(@messages)
  end
  
  def update
    if @comments.update(comment_params)
      redirect_to message_path(@messages)
    else
      render 'edit'
    end
  end

  #def destroy
  #  @messages.destroy
  #  redirect_to message_path(@messages)
  #end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_message
    @messages = Message.find(params[:message_id])
  end

  def find_comment
    @comments = @messages.comments.find(params[:id])
  end
end
