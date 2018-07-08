class TemaCurso < ApplicationRecord
	validates_presence_of :nome, :cor_titulo, :cor_texto, :cor_fundo
end
