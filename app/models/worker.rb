class Worker < ApplicationRecord

has_many :candidacies,  class_name: "Candidacies",
                        foreign_key: "worker_id",
                        dependent: :destroy
has_many :job_requests, through: :candidacies, source: :job_request

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
end
