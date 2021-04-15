# clase abstracta Secuencia
class Secuencia

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

  # inicializa la cola como vacía
  def initialize
    @cola = []
  end

  # agrega el elemento en la última posición
  def agregar(elem)
    @cola.append(elem)
  end

  # revisa si la pila no está vacía, si no lo está
  # haz un shift para eliminar el primer elemento de la lista
  def remover
    if self.vacio()
      raise 'La cola se encuentra vacía'
    else
      @cola.shift()
    end 
  end

  # revisa si la longitud de la lista es cero, lo que 
  # indica que está vacía.
  def vacio
    @cola.length() == 0
  end
end

# definición de la clase Pila
class Pila < Secuencia

  # incializa la pila como vacía
  def initialize
    @pila = []
  end

  # agrega un elemento de último (la izquierda simboliza el tope de
  # la pila)
  def agregar(elem)
    @pila.append(elem)
  end

  # revisa si la pila está vacía, si no lo está, obtén el último elemento
  # obtén los primeros n-1 elementos y settea la pila a ellos
  # retorna el valor del elemento que fue removido
  def remover
    if self.vacio()
      raise 'La pila se encuentra vacia'
    else
      elem = @pila.last
      @pila = @pila.first @pila.size - 1
      return elem
    end
  end

  # revisa si la longitud de la lista es cero, lo que 
  # indica que está vacía.
  def vacio
    @pila.length() == 0
  end
end
