class PaymentsController < ApplicationController
  def make_payment
    @sale = Sale.find(params[:payments][:sale_id])
    Payment.create(payment_type: params[:payments][:payment_type],
                   amount: payment_amount,
                   sale_id: params[:payments][:sale_id])

    respond_to do |format|
      format.js
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :amount, :sale_id)
  end

  def payment_amount
    params[:payments][:amount].tr("^0-9.", '')
  end
end
