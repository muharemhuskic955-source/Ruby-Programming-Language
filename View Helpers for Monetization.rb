module ApplicationHelper
  def premium_content_available?
    current_user.subscribed_to_premium? || current_user.business_plan?
  end
  
  def show_ads?
    !current_user.subscribed_to_premium?
  end
  
  def premium_features_count
    current_user.feature_accesses.premium.count
  end
  
  def calculate_ad_revenue(user)
    user.ad_impressions.count * 0.001 + user.ad_clicks.count * 0.05
  end
end
