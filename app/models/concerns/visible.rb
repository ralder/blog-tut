module Visible
  extend ActiveSupport::Concern
  extend Enumerize

  enumerize :status, in: %w[public private archived], predicates: true, scope: :having_status

  class_methods do
    def public_count
      having_status(:public).count
    end
  end
end
