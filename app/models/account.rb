class Account < ApplicationRecord
  has_secure_password # password conformation

  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "Email Address Invalid"}
  # REGEX referenced from: https://www.youtube.com/watch?v=l-Jv5vMjB70

  # dot num must be an integer
  validates :dotnum, presence: true, numericality: {only_integer: true, message: ".# Must be an Integer"}

  # first and laste name must be present
  validates :fname, presence: true
  validates :lname, presence: true


end
