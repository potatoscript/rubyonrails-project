class Job < ApplicationRecord
    validates :duedate, presence: true, length: {minimum: 5, maximum: 50}
    validates :job, presence: true, length: {minimum: 1, maximum: 1000}
    belongs_to :user
    #after_destroy {notify admin of bad behavior}
    has_many :comments, dependent: :destroy
end
