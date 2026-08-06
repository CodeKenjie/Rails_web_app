class CommentsController < ApplicationController
  before_action :authenticated?
  before_action :set_product

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user = Current.user
    if @comment.save
      redirect_to @product
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    if @comment.user == Current.user
      @comment.destroy
    else
      redirect_to @product, alert: "You are not allowed to delete this comment"
      return
    end

    redirect_to @product
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def comment_params
      params.expect(comment: [ :title, :body ])
    end
end
