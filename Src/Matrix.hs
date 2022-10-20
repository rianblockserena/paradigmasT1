module Src.Matrix where

-- a module to manipulate kojun matrixes.

import Src.Colors
import Src.Input
import Config

data Element = Element {
    getValue :: Int,      -- valor da celula
    getRegion :: Integer, -- id da regiao
    getI :: Int,          -- posicao linha
    getJ :: Int           -- posicao coluna
} deriving Eq

type Matrix = [[Element]] -- lista de listas de elementos
type Pos = (Int, Int)     -- tupla de posicao (IxJ)


-- gera uma nova matrix IxJ conforme o mapa de regioes (input)
novaMatriz :: Int -> Int -> Matrix
novaMatriz r c = [ [ (Element 0 (lerRegiao (i, j)) i j) | j<-[0..c-1]] | i<-[0..r-1] ]

-- le um id de regiao na posicao especifica (regionMap eh uma constante de config)
lerRegiao :: Pos -> Integer
lerRegiao (i, j) = (regionMap !! i) !! j


-- implementacao de == entre matrizes --
-- eq entre duas linhas
compararLinha :: [Element] -> [Element] -> Bool
compararLinha rowx row = ( rowx == row )

-- eq entre matrizes
compararMatriz :: Matrix -> Matrix -> Bool
compararMatriz [] [] = True
compararMatriz (rowx:matx) (row:mat) | (compararLinha rowx row) = compararMatriz matx mat
                                    | otherwise = False


-- retorna um elemento em uma posicao especifica
getElemento :: Matrix -> Pos -> Element
getElemento mat (i, j) = (mat !! i) !! j

-- seta um elemento em uma especifica posicao
setElemento :: Matrix -> Pos -> Element -> Matrix
setElemento m (r,c) x =
  take r m ++
  [take c (m !! r) ++ [x] ++ drop (c + 1) (m !! r)] ++
  drop (r + 1) m
