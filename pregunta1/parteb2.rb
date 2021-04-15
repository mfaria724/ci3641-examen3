require './parteb1.rb'

# definicion de la clase grafo
class Grafo
  attr_reader :adj_list

  # construye la matriz de ayacencias con puros 0s
  def initialize(size)
    @adj_list = Array.new(size) { Array.new(size, 0) }
  end

  # agrega un arco a -> b
  def add_edge(a,b)
    @adj_list[a][b] = 1
  end

  # representacion gráfica de la matriz de adyacencias
  def to_s
    @adj_list.inspect
  end
end

# definicion de la clase de busqueda
class Busqueda

  # devuelve la cantidad de nodos explorados entre d y h para encontrar un
  # camino. si no lo encuentra, devuelve -1. 
  def buscar(d, h, graph)

    # inicializacion de variables
    adj_list = graph.adj_list
    sucs = self.get_successors(d, adj_list, [])
    count = 1

    # mientras haya nuevos nodos que visitar
    while !sucs.vacio()

      # al visitar un nuevo nodo, aumenta el contador
      count += 1
      elem = sucs.remover()

      # si estamos en el nodo que buscamos, tenemos una respuesta.
      if elem == h
        return count
      end

      # expande ese nodo y agregalos según el orden del método
      sucs = self.get_successors(elem, adj_list, sucs)
    end

    # si no encontró solución, devuelve -1.
    return -1
    
  end

  # definición de firma para obtener los sucesores según el método escogido
  def get_successors(elem, adj_list)
    raise 'method not implemented'
  end
end

# definicion de la clase BFS
class BFS < Busqueda
  
  # devuelve la lista de sucesores actualizada 
  # como estamos implementando un BFS, utilizamos una Cola.
  def get_successors(elem, adj_list, prev)
    
    # obten los arcos que salen desde elem
    row = adj_list[elem]

    # si estamos empezando, el elemento neutro de Secuencia se definió como []
    # así que puede ser necesario inicializar la estructura.
    if prev.kind_of?(Array)
      sucs = Cola.new()
    else
      sucs = prev
    end

    # si existe una arco en la matriz, añádelo a la lista resultado.
    row.each_with_index { |adj, index|
      if adj == 1
        sucs.agregar(index)
      end
    }

    return sucs
  end

end

# definición de la clase dfs
class DFS < Busqueda

  # devuelve la lista de sucesores actualizada 
  # como estamos implementando un DFS, utilizamos una Pila.
  def get_successors(elem, adj_list, prev)
    
    # obten los arcos que salen desde elem
    row = adj_list[elem]

    # si estamos empezando, el elemento neutro de Secuencia se definió como []
    # así que puede ser necesario inicializar la estructura.
    if prev.kind_of?(Array)
      sucs = Pila.new
    else
      sucs = prev
    end

    # si existe una arco en la matriz, añádelo a la lista resultado.
    # iteramos la lista al revés para mantener el orden numérico ascendiente
    row.reverse.each_with_index { |adj, index|
      if adj == 1
        # como invertimos la lista, los indices cambiaron. 
        # para obtener el índice original, le restamos al actual al tamaño de la
        # lista menos 1
        sucs.agregar(row.length - 1 - index)
      end
    }

    return sucs
  end

end

# inicialización de un grafo de pruebas
graph = Grafo.new(5)
graph.add_edge(0,1)
graph.add_edge(0,2)
graph.add_edge(0,4)
graph.add_edge(1,3)
puts graph.to_s

# búsqueda por BFS
bfs = BFS.new
puts bfs.buscar(0,3,graph)
puts bfs.buscar(1,4,graph)

# búsqueda por DFS
dfs = DFS.new
puts dfs.buscar(0,3,graph)
puts dfs.buscar(1,4,graph)
