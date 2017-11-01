class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :properties
  validates :name, presence: {
    message: 'Você deve informar o seu nome'
  }

  validates :document,
    format: { with: /([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/,
    message: 'Informe seu cpf corretamente' }

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
