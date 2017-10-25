# == Schema Information
#
# Table name: properties
#
#  id                 :integer          not null, primary key
#  location           :string
#  area               :string
#  title              :string
#  description        :text
#  daily_rate         :decimal(, )
#  rooms              :integer
#  minimum_rent_days  :integer
#  maximum_rent_days  :integer
#  maximum_occupancy  :integer
#  usage_rules        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  property_type_id   :integer
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Property < ApplicationRecord
  belongs_to :property_type
  has_many :proposals
  has_many :season_rates
  has_many :unavailable_dates

  validates :title, presence: true

  validates :location, presence: {
    message: 'Você deve informar a Localização'
  }
  validates :rooms, presence: {
    message: 'Você deve informar o Quantidade de Quartos'
  }
  validates :daily_rate, presence: {
    message: 'Você deve informar o Preço da Diária'
  }

  has_attached_file :photo, styles: { medium: "318x180>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  do_not_validate_attachment_file_type :photo

end
