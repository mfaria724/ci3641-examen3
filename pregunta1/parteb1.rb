# clase abstracta Secuencia
class Secuencia

  # inicializa la secuencia como vacía
  def initialize
    @list = []
  end

  # recibe un elemento y lo agrega a la secuencia
  def agregar(elem)
    raise 'function not implementedf'
  end

  # remueve un elemento de la secuencia
  def remover
    raise 'function not implementedf'
  end

  # dice si la secuencia esta vacia
  def vacio
    raise 'function not implementedf'
  end
end

# definición de la clase secuencia
class Cola < Secuencia

  # constructor vacío
  def initialize
    super()
  end

  # agrega el elemento en la última posición
  def agregar(elem)
    @list.append(elem)
  end

  # revisa si la pila no está vacía, si no lo está
  # haz un shift para eliminar el primer elemento de la lista
  def remover
    if self.vacio()
      raise 'La cola se encuentra vacía'
    else
      @list.shift()
    end 
  end

  # revisa si la longitud de la lista es cero, lo que 
  # indica que está vacía.
  def vacio
    @list.length() == 0
  end
end

# definición de la clase Pila
class Pila < Secuencia

  # constructor vacío
  def initialize
    super()
  end
  
  # agrega un elemento de último (la izquierda simboliza el tope de
  # la pila)
  def agregar(elem)
    @list.append(elem)
  end

  # revisa si la pila está vacía, si no lo está, obtén el último elemento
  # obtén los primeros n-1 elementos y settea la pila a ellos
  # retorna el valor del elemento que fue removido
  def remover
    if self.vacio()
      raise 'La pila se encuentra vacia'
    else
      elem = @list.last
      @list = @list.first @list.size - 1
      return elem
    end
  end

  # revisa si la longitud de la lista es cero, lo que 
  # indica que está vacía.
  def vacio
    @list.length() == 0
  end
end
