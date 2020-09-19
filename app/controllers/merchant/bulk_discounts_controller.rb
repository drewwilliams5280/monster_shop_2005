class Merchant::BulkDiscountsController < Merchant::BaseController

  def new
  end

  def create
    merchant = Merchant.find(current_user.merchant_id)
    merchant.create_bulk_discount(params)
    redirect_to "/merchant/discounts"
  end

end
