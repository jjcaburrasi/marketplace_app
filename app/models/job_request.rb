class JobRequest < ApplicationRecord
    belongs_to :client, class_name: "Client"
end
