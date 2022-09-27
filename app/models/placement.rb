class Placement < ApplicationRecord
    belongs_to :client
    belongs_to :candidacy
    belongs_to :worker
end
