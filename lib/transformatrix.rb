require "transformatrix/version"

class TMatrix
	include Math

	:attr matrix

	def rotation angle
		matrix = Matrix.new [ \
			[cos(angle),	sin(angle),	0], \
			[-sin(angle),	cos(angle),	0], \
			[0,				0,			1]]
	end

	def translation x, y
	end


end
