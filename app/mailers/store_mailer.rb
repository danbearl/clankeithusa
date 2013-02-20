class StoreMailer < ActionMailer::Base
  default from: "dan.bearl@gmail.com"
  default to: "dan.bearl@gmail.com"

  def order_confirmation(order)
    @order = order

    mail(to: order.email, subject: "Clan Keith, USA Order Confirmation")
  end

  def order_notification(order)
    @order = order

    mail(subject: "New order from clankeithusa.org")
  end
end
