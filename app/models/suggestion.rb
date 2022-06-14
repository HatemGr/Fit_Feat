class Suggestion < ApplicationRecord
  belongs_to :partner, class_name: "User"
  belongs_to :user, class_name: "User"

  validates_uniqueness_of :partner, :scope => [:user]
  after_destroy :destroy_pair_suggestion
  after_create :create_pair_suggestion
  after_update :check_suggestion_status

  def check_suggestion_status
    pair_suggestion = Suggestion.find_by(user: partner, partner: user)
    if refused || pair_suggestion.refused 
      self.update(refused: true)
      pair_suggestion.update(refused: true)
    elsif accepted && pair_suggestion.accepted 
      Connection.create(user:self.user,friend: pair_suggestion.user)
    end
  end


  def destroy_pair_suggestion 
    unless Suggestion.find_by(partner: user, user: partner).nil?
      Suggestion.find_by(partner: user, user: partner).destroy
    end
  end

  def create_pair_suggestion
    if Suggestion.find_by(partner: user, user: partner).nil?
      Suggestion.create(partner: user, user: partner)
    end
  end

  def self.make_suggestions(user)
    Suggestion.where(user: user).destroy_all

    users_around = user.nearbys(10)
    user_sports = user.sports

    user_sports.each do |sport|
      user_perf_score = SportUser.find_by(user:user, sport: sport).perf_score
      users_around.each do |user_around|
        record = SportUser.find_by(user:user_around,sport:sport)
        unless record.nil?
          if ((record.perf_score > (user_perf_score - 1)) && (record.perf_score < user_perf_score  + 1))
            Suggestion.create(user: user,partner:user_around)
          end
        end
      end
    end
  end


end
