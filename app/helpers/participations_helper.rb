module ParticipationsHelper
  def find_participation (event,user)
    Participation.find_by(event:event,user:user)
  end
end
