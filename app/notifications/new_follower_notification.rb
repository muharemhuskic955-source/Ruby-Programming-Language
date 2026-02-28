class NewFollowerNotification < Noticed::Base
  deliver_by :database
  deliver_by :action_cable # Za real-time ažuriranje
  
  def message
    "Korisnik #{params[:follower].name} vas sada prati!"
  end
end
