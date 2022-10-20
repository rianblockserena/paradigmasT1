module Src.Print where

-- a module to print things.

import Src.Matrix
import Src.Colors

-- pega cor com base na regiao, ou, se vazio, retorna cor erro
pegarCor :: Element -> String
pegarCor e | ( (getValue e) /= 0 ) = translateColor (getRegion e)
           | otherwise = eColor

-- converte linha para string com cores
linhaStr :: [Element] -> String
rowToString [] = "\n"
rowToString (e:l) = ( "\ESC[1m" ++ (pegarCor e) )
                    ++ (show (getValue e)) ++ endColor
                    ++ " " ++ (rowToString l) ++ "\ESC[0m"

-- coverte a matriz inteira a uma string foramatada
matrizStr :: Matrix -> String
matrizStr [] = ""
matrizStr (row:mat) = (rowToString row) ++ (matrizStr mat)

-- printa uma matriz 2d
printMatriz :: Matrix -> IO()
printMatriz mat = putStrLn (matrizStr mat)
