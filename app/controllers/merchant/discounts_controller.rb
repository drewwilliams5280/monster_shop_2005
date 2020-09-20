class Merchant::DiscountsController < Merchant::BaseController

  def index
    @merchant = Merchant.find(current_user.merchant_id)
    @discounts = @merchant.discounts
  end

  def new
  end

  def create
    if verify_item_belongs_to_merchant(params[:item_id])
      discount = Discount.new(discount_params)
      if discount.save
        redirect_to "/merchant/discounts"
      else
        flash[:error] = discount.errors.full_messages.to_sentence
        render :new
      end
    else
      flash.now[:error] = "Please make sure form is filled out and item belongs to you."
      render :new
    end
  end

  def edit
    @discount = Discount.find(params[:id])
  end

  def update
    @discount = Discount.find(params[:id])
    if @discount.update(discount_params)
      flash[:notice] = "Edit Successful!"
      redirect_to '/merchant/discounts'
    else
      flash.now[:notice] = @discount.errors.full_messages.uniq.to_sentence
      render :edit
    end
  end

  def destroy
    discount = Discount.find(params[:id])
    discount.destroy
    redirect_to "/merchant/discounts"
  end

  private
  def discount_params
    params.permit(:name, :quantity, :percentage, :item_id)
  end

  def verify_item_belongs_to_merchant(id)
    if Item.where(id: id) == [] || Item.find(id).merchant_id != current_user.merchant_id
      return false
    else
      return true
    end
  end

end
