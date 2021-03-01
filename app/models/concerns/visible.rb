module Visible
  extend ActiveSupport::Concern

  included do
    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
