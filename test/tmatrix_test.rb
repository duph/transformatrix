require 'test/unit'

require_relative '../lib/transformatrix'

class TestTMatrix < Test::Unit::TestCase
	def test_rotation
		angle = 0.05 * rand(0..20) * Math::PI
		assert_equal TMatrix.rotation(angle), \
		Matrix[ \
		[Math::cos(angle),	Math::sin(angle),	0], \
		[-Math::sin(angle),	Math::cos(angle),	0], \
		[0,					0,					1]]
	end

	def test_translation
		assert_equal TMatrix.translation(2,3), Matrix[[1,0,2],[0,1,3],[0,0,1]]
	end

	def test_reflection
		assert_equal TMatrix.reflection(1,1), Matrix[[0,2,0],[2,0,0],[0,0,2]]
	end

	def test_scaling
		assert_equal TMatrix.scaling(2,3), Matrix[[2,0,0],[0,3,0],[0,0,1]]
	end

	def test_multiply
		m = TMatrix.scaling(2,3) * TMatrix.translation(3,3)
		assert m.is_a? Matrix
	end

	def test_multiply_array
		assert_equal TMatrix.translation(2,2) * [0,0], [2,2]
	end

	def test_multiplication_homogenous_array
		assert_equal TMatrix.translation(2,2) * [0,0,1], [2,2,1]
	end

	def test_multiply_vector
		assert_equal TMatrix.translation(2,3) * Vector[0,0], Vector[2,3]
	end

	def test_multiplication_homogenous_vector
		assert_equal TMatrix.translation(2,2) * Vector[0,0,1], Vector[2,2,1]
	end

	# def test_multiplication_vector
	# 	assert_equal TMatrix.translation(2,2) * Vector[0,0], Vector[2,2]
	# end
end
