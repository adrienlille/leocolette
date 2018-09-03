class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.messages
    end
  end

  def index?
    true
  end
end
