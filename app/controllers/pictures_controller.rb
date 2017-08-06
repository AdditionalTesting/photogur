class PicturesController < ApplicationController
  def index
    @most_recent_pictures = Picture.most_recent_five
    @older_than_a_month = Picture.created_before(1.month.ago)
    @pictures_created_in_2017 = Picture.pictures_created_in_year(2017)
    @pictures_created_in_2016 = Picture.pictures_created_in_year(2016)
    @pictures_created_in_2015 = Picture.pictures_created_in_year(2015)

  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)


  if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

  if @picture.update(picture_params)
    redirect_to "/pictures/#{@picture.id}"
  else
    render :edit
  end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

def picture_params
  params.require(:picture).permit(:title, :artist, :url)

end

end
