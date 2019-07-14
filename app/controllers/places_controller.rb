class PlacesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all 
  end

  def new
    @place = Place.new
  end

  def create
  @place = current_user.places.new(allowed_params)
  if @place.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end 
 
def allowed_params
    params.require(:place).permit(:name, :address, :description)
end 

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.Find(params[:id])
  end

  def update
     @place = Place.find(params[:id])
    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
    end
    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
  end
end



def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
    @place.destroy
    redirect_to root_path
end

def edit
    @place = Place.find(params[:id])
    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end

def address
    @address = Place.find(params[:id])
    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
    @place.address
    redirect_to root_path
end

def description
    @description = Place.find(params[:id])
    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
    @place.description
    redirect_to root_path
end

def name
    @name = Place.find(params[:id])
    if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden, length: { maximum: 140, minimum: 3 }
  end
    @place.name
    redirect_to root_path
end


  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end
end
