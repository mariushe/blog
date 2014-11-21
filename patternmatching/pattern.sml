fun pCons [] = "nil"
  | pCons (x::xs) = (concat ["(",(Int.toString x),".",(pCons xs),")"]);
   
(pCons []);
(pCons [1,2,3]);