require_relative "transformatrix/version"
require 'matrix'

class TMatrix
	include Math

	attr :matrix

	def initialize
		self
	end

	def [] param
		@matrix = Matrix[param]
		self
	end

	#Create matrix for rotating alpha radians about origo
	def rotation alpha
		@matrix = Matrix[[cos(alpha), sin(alpha), 0], [-sin(alpha), cos(alpha), 0], [0, 0, 1]]
		self
	end

	#Create matrix for translating by [tx, ty]
	def tranlation tx, ty
		@matrix = Matrix[[1, 0, tx], [0, 1, ty], [0, 0, 1]]
		self
	end

	#Create matrix for reflecting about a line interpolating (0,0) and (lx,ly)
	#b=lx a=-ly
	def reflection lx, ly
		@matrix = Matrix[[lx**2-ly**2, 2*lx*ly, 0], [2*lx*ly, ly**2-lx**2, 0], [0, 0, lx**2+ly**2]]
		self
	end

	#Create matrix for scaling relative to origo
	def scaling sx, sy
		@matrix = Matrix[[sx, 0, 0], [sy, 0, 0], [0, 0, 1]]
		self
	end
end