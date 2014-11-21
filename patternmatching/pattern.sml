fun pCons [] = "nil"
  | pCons (x::xs) = (concat ["(",(Int.toString x),".",(pCons xs),")"]);
   
(pCons []);
(pCons [1,2,3]);

datatype exp = Fun of exp | Number of int | Sum of exp * exp | Product of exp * exp;

fun prn (Number(x)) = (Int.toString x)
  | prn (Sum(e1, e2)) = (concat ["(+ ", (prn e1), " ", (prn e2), ")"])
  | prn (Product(e1, e2)) = (concat ["(* ", (prn e1), " ", (prn e2), ")"])
  | prn (Fun(e)) = (concat ["(fn [] ", (prn e), ")"]);

(prn (Fun(Product(Sum(Number(4), Number(2)), Number(3)))));

fun calc (Number(x)) = x
  | calc (Sum(e1, e2)) = (calc e1) + (calc e2)
  | calc (Product(e1, e2)) = (calc e1) * (calc e2)
  | calc (Fun(e)) = (calc e);

(calc (Fun(Product(Sum(Number(4), Number(2)), Number(3)))));