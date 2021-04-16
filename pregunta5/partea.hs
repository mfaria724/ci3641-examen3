-- NORMAL:

takeWhile (<=3) (gen 1)
foldr (\a r -> if (<=3) a then a : r else []) [] (gen 1)
foldr (\a r -> if (<=3) a then a : r else []) [] ([1] : (gen 2))
(\a r -> if (<=3) a then a : r else []) [1] $ 
  (foldr (\a r -> if (<=3) a then a : r else []) []) (gen 2)
[1] : foldr (\a r -> if (<=3) a then a : r else []) [] (gen 2)
[1] : foldr (\a r -> if (<=3) a then a : r else []) [] ([2] : (gen 3))
[1] : (\a r -> if (<=3) a then a : r else []) [2] $ 
  (foldr (\a r -> if (<=3) a then a : r else []) []) (gen 3)
[1] : [2] : (foldr (\a r -> if (<=3) a then a : r else []) []) (gen 3)
[1,2] : foldr (\a r -> if (<=3) a then a : r else []) [] (gen 3)
[1,2] : foldr (\a r -> if (<=3) a then a : r else []) [] ([3] : (gen 4))
[1,2] : (\a r -> if (<=3) a then a : r else []) [3] $
  (foldr (\a r -> if (<=3) a then a : r else []) []) (gen 4)
[1,2] : (\a r -> if (<=3) a then a : r else []) [3] $
  (foldr (\a r -> if (<=3) a then a : r else []) []) (gen 4)
[1,2] : [3] : (foldr (\a r -> if (<=3) a then a : r else []) []) (gen 4)
[1,2,3] : (foldr (\a r -> if (<=3) a then a : r else []) []) (gen 4)
  --- ...

̈́{-
 Esto va a continuar generando números porque gen genera una lista infinita
 the siempre será evaluada por foldr a ver si cumple con la función, que nos
 comenzará a retornar siempre la lista vacía.
-}

-- APLICATIVA:
takeWhile (<=3) (gen 1)
takeWhile (<=3) ([1] : gen 2))
takeWhile (<=3) ([1] : [2] : gen 3))
takeWhile (<=3) ([1,2] : gen 3))
takeWhile (<=3) ([1,2] : [3] : gen 4))
-- ...

{-
  Esto va a continuar generando números infinitamente porque al necesitar que se
  encuentren evaluados los parámetros, gen siempre va a tener un nuevo valor que 
  generar por lo que nunca va a llegar a un estado donde esté completamente
  evaluado.
-}
