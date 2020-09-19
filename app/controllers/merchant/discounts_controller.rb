class Merchant::DiscountsController < Merchant::BaseController

  def index
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
