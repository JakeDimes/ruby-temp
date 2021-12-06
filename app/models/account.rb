class Account < ApplicationRecord
  has_secure_password
  #validate :email, presence: true, format: {with: /\A[^@}
end
