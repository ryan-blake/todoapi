class Api::ListsController < ApiController
  before_action :authenticated?

  def create

    @list = List.create!(list_params)
    @user = User.find_by(full_name: params[:id])
    if @list.save

      render json: @list
    else

      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @user = User.find_by(full_name: params[:id])
      list = List.find_by(params[:id])
      list.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
