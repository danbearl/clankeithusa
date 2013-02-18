class StoreMailer < ActionMailer::Base
  default from: "dan.bearl@gmail.com"

  def order_confirmation(order)
    @order = order

    mail(to: order.email, subject: "Clan Keith, USA Order Confirmation")
  end
end
