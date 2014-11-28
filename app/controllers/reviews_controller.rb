class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    @event = Event.find(params[:event])
    @@eventID = params[:event].to_i
  end

  def edit
  end

  def submit
    r = Review.new
    r.userID = current_user.email
    r.reviewText = params['reviewText']
    r.eventID = @@eventID
    r.save
    redirect_to '/tickets/my_tickets'
  end

  def my_reviews
    @reviews = Review.where(:userID => current_user.email)
  end

  def create
    @review = Review.new(review_params)
    @review.save
    respond_with(@review)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:userID, :eventID, :reviewText)
    end
end
