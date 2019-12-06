class Driver < ApplicationRecord
    has_many :rides
    has_many :riders, through: :rides

    driverDisplay = rand(Driver.all)

end
