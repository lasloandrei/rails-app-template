class Contact < ActiveRecord::Base
  has_many :reservations, :inverse_of => :contact
  accepts_nested_attributes_for :reservations
  
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone_number, presence: true, numericality: { message: 'has to be digits ONLY!' }, length: { minimum: 10, maximum: 15 }
  validates_format_of :email, with: /.+@.+\..+/i, allow_blank: true
  #Function displays the first_name of the Contact in Activeadmin dropdown
  def display_name
    first_name
  end
end
