import sys

def describe_class(cmd, classes):
  """ Describes a class with all the methods defined on it or in its ancestors.
  """

  try:
    # check if the class to be described exists
    class_name = cmd[0]

    if not class_name in classes:
      print('La clase no se encuentra definida.')
      return

    # look for class info
    class_dict = classes[class_name]

    # store names that has already been defined
    defined_names = {}

    # print all names in current class
    print_class_names(class_dict, class_name, defined_names)

    # if class has inheritance, loop through all ancestors
    if '<super>' in class_dict:
      temp_dict = class_dict.copy()

      while '<super>' in temp_dict:
        class_name = temp_dict['<super>']
        temp_dict = classes[class_name]
        print_class_names(temp_dict, class_name, defined_names)

  except:
    # if something goes wrong on execution time, remember the correct syntax.
    print('Por favor, ingrese una opción válida.')
    print('Debe seguir el formato DESCRIBIR <nombre>')

def print_class_names(class_dict, class_name, defined_names):
  """ prints the names inside a class structure and stores the ones that have
      been defined already.
  """
  for name in class_dict:
    # check that it is not a class and that hasn't been defined
    if name != '<super>' and not name in defined_names:
      defined_names[name] = True
      print(f'{name} -> {class_name} :: {name}')


def define_class(cmd, classes):
  """ Defines a class with the names given. It can also recieve the parent
      from which the class will inherit methods.
  """

  # define a structure for the class names
  class_dict = {}

  try:
    # check if class name is already in use
    class_name = cmd[0]

    if class_name in classes:
      print('El nombre ya se encuentra definido.')
      return

    # check if has inheritance.
    if cmd[1] == ':':

      # checks if father is already defined
      super_class = cmd[2]

      if not super_class in classes:
        print('La clase padre no ha sido definida.') 
        return

      # sets father class
      class_dict['<super>'] = super_class
      names = cmd[3:]
    else:
      # if not inheritance is needed, just remove the class name token
      names = cmd[1:]

    # for each name defined, add it to the class structure.
    for name in names:

      # if a name has been defined multiple times throw an error.
      if name in class_dict:
        print('Existen definiciones repetidas en la lista de nombres de métodos.')
        return

      class_dict[name] = True

    # if everything is okay, store the class
    classes[class_name] = class_dict

  except:
    # if something goes wrong on execution time, remember the correct syntax.
    print('Por favor, ingrese una opción válida.')
    print('Debe seguir el formato CLASS <tipo> [<nombre>]')

def main():
  """ Initialize infinte loop to ask for commands.
  """

  # welcome message
  print('¡Bienvenido a su manejador de tablas de métodos de confiaza!')

  # main structure for classes defined
  classes = {} 

  while True:

    # ask for input and split it by tokens
    user_input = input('$> ')
    cmd = user_input.split(' ')

    # first token determine the action to be taken
    if cmd[0] == 'CLASS':
      define_class(cmd[1:], classes)
    elif cmd[0] == 'DESCRIBIR':
      describe_class(cmd[1:], classes)
    elif cmd[0] == 'SALIR':
      print('¡Hasta la próxima!')
      sys.exit(0)
    else:
      # show error if the action is invalid
      print('Por favor, ingrese un comando válido.')

if __name__ == '__main__':
  # starts main program
  main()
