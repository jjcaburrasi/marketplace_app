class Worker < ApplicationRecord

has_many :candidacies, dependent: :destroy
has_many :job_requests, through: :candidacies
has_many :placements, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
end
