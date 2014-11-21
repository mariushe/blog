pCons :: [Int] -> String
pCons [] = "nil"   
pCons (x:xs) = "(" ++ show x ++ "." ++ pCons xs ++ ")"