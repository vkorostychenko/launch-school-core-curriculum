=begin
Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
the transpose of the original matrix. Note that there is a Array#transpose
method that does this -- you may not use it for this exercise. You also are not
allowed to use the Matrix class from the standard library. Your task is to do
this yourself.

Take care not to modify the original matrix: you must produce a new matrix and
leave the original matrix unchanged.

Further Exploration
Write a transpose! method that transposes a matrix in place. The obvious
solution is to reuse transpose from above, then copy the results back into the
array specified by the argument. For this method, don't use this approach; write
a method from scratch that does the in-place transpose.
=end

def transpose!(matrix)
  copy_matrix = matrix.map { |row| row.dup }

  (0...matrix.size).each do |column_idx|
    (0...matrix.size).each do |row_idx|
     matrix[column_idx][row_idx] = copy_matrix[row_idx][column_idx]
    end
  end

  matrix
end
  
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix.object_id == new_matrix.object_id
