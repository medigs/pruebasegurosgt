class Reporte < ApplicationRecord
  belongs_to :usuario

  enum estado: { act: 0, rec: 1, com: 2 }

  # Validaciones opcionales
  validates :nombre_reporte, presence: true
  validates :estado, presence: true
end
