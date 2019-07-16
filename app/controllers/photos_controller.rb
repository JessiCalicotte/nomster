class PhotosController < ApplicationController
before_action :authenticate_user!

def create
  @photo = Place_id.find(params[:id])
  @photo = Caption.new
  @photo.create(photo_params.merge(user: current_user))
  redirect_to photo_path(@place)
  end

   private

    def show
    @photo = Photo.new
  end

  def photo_params
    params.require(:Place_id).permit(:photo, :caption)
  end
end
