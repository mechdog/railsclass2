class Origin < ActiveRecord::Base
  has_many :coffee_beans
  has_many :roasters, through: :coffee_beans

  validates :country, format: { 
              with: /\A[A-Z]{3}\z/,
              message: "must be an ISO-1366 3-character country code" 
                  }

  before_validation :upcase_country

  private
  def upcase_country
    self.country = country.upcase
  end
end

