import multiprocessing as mp
import numpy as np

# creates 2 random matrixes with number between 0 and 10
# also converts both of them into lists to avoid using
# numpy structure.
A = np.random.randint(0, 10, size=(5,5)).tolist()
B = np.random.randint(0, 10, size=(5,5)).tolist()

print(A)
print(B)

def sum_row(row, A, B):
  """ sum the elements that are in the same positions in both matrixes.
  """

  # avoid calling the matrix on each execution
  row_A = A[row]
  row_B = B[row]

  # initialize the result row
  result_row = []

  # iterate over the elements on the row
  for i in range(0,len(row_A)):
    # append the new number to the result row
    result_row.append(row_A[i] + row_B[i]) 

  return result_row

def main():
  """ Initializes the structure of the program
  """
  # creates a pool of processes with the same number process as cores has the
  # machine where the code will be executed.
  pool = mp.Pool(mp.cpu_count())

  # sum each row individually
  C = [pool.apply(sum_row, args=(row, A, B)) for row in range(0,len(A))]

  # shows the result
  print(C)

if __name__ == '__main__':
  main()
