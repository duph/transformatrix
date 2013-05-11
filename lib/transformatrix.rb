require_relative "transformatrix/version"
require 'matrix'

class TMatrix
	include Math

	attr :matrix

	def initialize
		self
	end

	def rotation angle
		base = []
		@matrix = Matrix[[cos(angle), sin(angle), 0], [-sin(angle), cos(angle), 0], [0, 0, 1]]

	end

	def tranlation x, y
	end
end
