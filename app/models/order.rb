class Order < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  monetize :amount_cents

  def status_tag
    if self.state =='paid'
      return '<span class="label label-success">Paid</span>'
    else
      return '<span class="label label-warning">Unpaid</span>'
    end
  end

end
