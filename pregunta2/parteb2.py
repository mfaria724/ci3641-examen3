import threading
import os
import sys

def count_files_in_dir(path):
  """ prints the number of files in the give path and starts a new thread 
      for each new directory found in the path
  """

  # get the information about the curren path
  for (dirpath, dirnames, filenames) in os.walk(path):

    # display the number of files in the current path
    print(f'{threading.get_ident()} --> There are {len(filenames)} files in directory {path}')
    
    # start a new thread for each directory
    for dir_name in dirnames:

      # checks if the new path needs to be divided with a / 
      if path[-1] == '/':
        new_path = path + dir_name
      else:
        new_path = f'{path}/{dir_name}'
        
      # creates a new thread and starts it
      # it won't waint until the thread has finished
      t = threading.Thread(target=count_files_in_dir, args=(new_path,))
      t.start()

    break

def main():
  """ starts the main execution of the script
  """
  # starts the main thread with the path given as argument of the script 
  t = threading.Thread(target=count_files_in_dir, args=(sys.argv[-1],))
  t.start()

if __name__ == '__main__':
  main()
