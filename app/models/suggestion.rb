class Suggestion < ApplicationRecord
  belongs_to :partner, class_name: 'User'
  belongs_to :user, class_name: 'User'

  validates_uniqueness_of :partner, scope: [:user]
  after_destroy :destroy_pair_suggestion
  after_create :create_pair_suggestion
  after_update :check_suggestion_status

  def pair_suggestion
    Suggestion.find_by(user: partner, partner: user)
  end

  def is_full_accepted
    accepted && pair_suggestion.accepted
  end

  def is_refused
    refused || pair_suggestion.refused
  end

  def check_suggestion_status
    Connection.create(user: user, friend: pair_suggestion.user) if is_full_accepted
  end

  def destroy_pair_suggestion
    pair_suggestion.destroy unless pair_suggestion.nil?
  end

  def create_pair_suggestion
    Suggestion.create(partner: user, user: partner) if pair_suggestion.nil?
  end

  def self.make_suggestions(user)
    if user.longitude
      Suggestion.where(user: user).where(refused: nil).destroy_all
      users_around = user.nearbys(10).select { |u| user.friends.exclude?(u) }
      user_sports = user.sports

      user_sports.each do |sport|
        user_perf_score = SportUser.find_by(user: user, sport: sport).perf_score
        next unless users_around

        users_around.each do |user_around|
          record = SportUser.find_by(user: user_around, sport: sport)
          next if record.nil? || Suggestion.find_by(user: self, partner: user_around)

          if (record.perf_score > (user_perf_score - 1)) && (record.perf_score < (user_perf_score + 1))
            Suggestion.create(user: user, partner: user_around)
          end
        end
      end
    end
  end
end
