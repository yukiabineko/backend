class Shopping < ApplicationRecord
  belongs_to :user
  enum status: { 
    request: 0, 
    processed: 1,
    passed: 2
  }
end
