module Visible
  extend ActiveSupport::Concern
  extend Enumerize

  enumerize :status, in: %w[published inactive archived], predicates: true, scope: :having_status

  class_methods do
    def public_count
      having_status(:published).count
    end
  end
end
