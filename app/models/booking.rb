class Booking < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
  monetize :price_cents

  validates :status, inclusion: { in: %w(pending canceled approved) }

  def status_tag
    if self.status == 'pending'
      return '<span class="label label-warning">Pending</span>'
    elsif self.status == 'canceled'
      return '<span class="label label-danger">Canceled</span>'
    else
      return '<span class="label label-success">Approved</span>'
    end
  end
end
