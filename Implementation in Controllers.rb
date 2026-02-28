class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    plan = Plan.find(params[:plan_id])
    @subscription = current_user.subscriptions.build(plan: plan)
    
    # Process payment
    if process_payment(plan.monthly_price)
      @subscription.update(status: :active, expires_at: 30.days.from_now)
      redirect_to dashboard_path, notice: 'Premium subscription activated!'
    else
      redirect_to pricing_path, alert: 'Payment failed. Please try again.'
    end
  end
  
  def upgrade
    new_plan = Plan.find(params[:new_plan_id])
    current_subscription = current_user.active_subscription
    
    if current_subscription && current_subscription.plan.type != new_plan.type
      # Process upgrade payment difference
      if process_payment(new_plan.monthly_price - current_subscription.plan.monthly_price)
        current_subscription.update(plan: new_plan, expires_at: 30.days.from_now)
        redirect_to dashboard_path, notice: 'Plan upgraded successfully!'
      end
    end
  end
  
  private
  
  def process_payment(amount)
    # Integrate with Stripe, PayPal, etc.
    # Return true/false based on payment success
    true  # Placeholder
  end
end
