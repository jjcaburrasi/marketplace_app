class Client < ApplicationRecord
  
  has_many :job_requests, class_name: "JobRequests",
                          foreign_key: "client_id",
                          dependent: :destroy

  has_many :placements , class_name: "Placements",
                         foreign_key: "client_id",
                         dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
