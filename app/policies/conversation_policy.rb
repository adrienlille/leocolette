class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where('user1_id=? OR user2_id=?', user.id, user.id)
    end
  end

  def create?
    true
  end
end
