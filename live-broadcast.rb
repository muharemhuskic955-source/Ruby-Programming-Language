class Follow < ApplicationRecord
  after_create_commit :notify_recipient

  private

  def notify_recipient
    NewFollowerNotification.with(follower: follower).deliver_later(followed_user)
    
    # Turbo Stream emitovanje direktno u UI
    Turbo::StreamsChannel.broadcast_prepend_to(
      "notifications_#{followed_user.id}",
      target: "notifications_list",
      partial: "notifications/notification",
      locals: { notification: self }
    )
  end
end
```
