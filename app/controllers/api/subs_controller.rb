class Api::SubsController < ApplicationController
  # traffic directors
  # base off of the router, we are going to do something in one of the methods

  # methods - "Actions": main features we can do in our app, CRUD

  # index: GET, grab all of our records of the table
  # show: GET, ID, grab one of the records based off the ID
  # create: POST, attr, obj, go thorugh validations, models, and params:
  #   if else, create the obj and store within our database
  # update PUT, ID, obj, go thorugh validations, models, and params:
  #   if else, update the obj based off of ID and store within our database
  # destroy: DELETE, id delete from the table
  
    # follow a pattern to fill out the controller
  
  # new edit - forms which is handled on the react side (not here)

  # controller html json, xml, redirect to a action that does

  # skinny controllers - fat model
  # callback, trigger logic on actions
  before_action only, except
  after_action
  skip_before_action
  skip_after_action

  # pattern
  # model, -> Sub
  # singular, Capital, 

  # def index
  #   render json: Model_name.all
  # end

#   def show
#   @model_name = Model_name.find(params[:id])
#   render json: @model_name
#   end

#   def create
#     @model_name = Model_name.new(model_name_params)
#     if @model_name.save
#       render json: @model_name
#     else
#       render json: {errors: @model_name.errors }, status: :unprocessable_entity
#     end
#   end

# def update
#   @model_name = Model_name.find(params[:id])
#   if @model_name.update(model_name_params)
#     render json: model_name
#   else
#     render json: {errors: @model_name.errors }, status: :unprocessable_entity
#   end
# end

# def destroy
#   @model_name = Model_name.fin(params[[:id]])
#   @model_name.destroy
#   render json: { message: 'something deleted'}
# end

#   private
#     def model_name_params
#       params.require(:model_name).permit(:attr, :attr2)
#     end

  # Model -> Sub

  # after a controller is filled out, then move on to the front end 
  # and fill that out
  before_action :set_sub, only: [:show, :update, :destroy]

  def index
    render json: Sub.all
  end

  def show
    # @sub = Sub.find(params[:id])
    render json: @sub
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save 
      render json: @sub 
    else
      render json: { errors: @sub.errors }, status: :unprocessable_entity
    end
  end

  def update
    # @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      render json: @sub
    else
      render json: { errors: @sub.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    # @sub = Sub.find(params[:id])
    @sub.destroy
    render json: { message: 'Sub deleted' }
    # or 
    # Sub.find(params[:id]).destroy
    # render json: { message: 'Sub deleted' }
  end

  private 
    # { sub: { title: 'puppies'} } -> permitted
    # { sub: { title: 'puppies', email: 'asdfaf@adfasdf', age: 2323} } -> no permitted
    # prevents sql injection

    # { sub: { title: 'puppies', user: 'SELECT SSN, CCNUM FROM USER'} }
    # { sub: { title: 'SELECT SSN, CCNUM FROM USER'} }
    # make sure it is in a right format and passing the right fields
    def sub_params
      params.require(:sub).permit(:title) 
    end

    def set_sub
      @sub = Sub.find(params[:id])
    end
end