require_relative "transformatrix/version"
require 'matrix'

class TMatrix < Matrix
	
	#Multiplication with 2D vector or array
	def * arg
		if arg.is_a? Array
			multiply_array arg
		elsif arg.is_a? Vector
			Vector.elements multiply_array(arg.to_a)
		else
			super.* arg
		end
	end

	def multiply_array array
		return_size = array.size

		if array.size == 2
			array.push 1
		end

		ret = []
		rows.each_with_index do |row, m|
			ret.push(0)
			row.each_with_index do |e, n|
				ret[m] += array[n] * e
			end
		end

		ret[0..return_size-1]
	end
	private :multiply_array

	#Create matrix for rotating alpha radians about origo
	def self.rotation alpha
		rows [ \
			[Math::cos(alpha),	Math::sin(alpha),	0], \
			[-Math::sin(alpha),	Math::cos(alpha),	0], \
			[0,					0,					1]]
	end

	#Create matrix for translating by [tx, ty]
	def self.translation tx, ty
		rows [\
			[1, 0, tx	],\
			[0, 1, ty	],\
			[0, 0, 1	]]
	end

	#Create matrix for reflecting about a line interpolating (0,0) and (lx,ly)
	def self.reflection lx, ly
		rows [\
			[lx**2-ly**2,	2*lx*ly,		0			],\
			[2*lx*ly,		ly**2-lx**2,	0			],\
			[0,				0,				lx**2+ly**2	]]
	end

	#Create matrix for scaling relative to origo
	def self.scaling sx, sy
		rows [\
			[sx,	0,	0],\
			[0,		sy,	0],\
			[0,		0,	1]]
	end
end