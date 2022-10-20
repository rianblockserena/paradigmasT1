module Src.Solver where

import Src.Matrix
import Tests.Adjacency
import Tests.Empty
import Tests.Region
import Tests.Upper

-- retorna tamanho da regiao
lerRegiao :: Matrix -> Element -> Int
lerRegiao mat e = sum [1 | row <- mat, element <- row, ( ((getRegion e) == (getRegion element)) && ((getValue e) == 0 ) )]


-- procura elemento invalido (retorna primeiro que achar) --
-- procura na linha
buscaNaLinha :: Matrix -> [Element] -> Pos
buscaNaLinha refMat [] = (-1, -1)
buscaNaLinha refMat (e:row) | ( not (valido refMat e) ) = ((getI e), (getJ e))
                           | otherwise = buscaNaLinha refMat row

-- procura em toda matriz
buscaInvalido :: Matrix -> Matrix -> Pos
buscaInvalido refMat [] = (-1, -1)
buscaInvalido refMat (row:mat) | ( (buscaNaLinha refMat row) /= (-1, -1) ) = buscaNaLinha refMat row
                               | otherwise = buscaInvalido refMat mat


-- testa se determinado elemento eh valido na matriz
valido :: Matrix -> Element -> Bool
valido mat e | (hasEqAdjacenct mat e) || (existsInRegion mat e) || (emptyElement e) || (hasUpperLower mat e)  = False
            | otherwise = True

-- tenta inserir elemento em determinada posicao (tentando de len(region) ate 1)
testaTudo :: Matrix -> Pos -> Int -> Matrix
testaTudo mat pos 0 = mat
testaTudo mat (i, j) possible | valido mat (Element possible (getRegion (getElement mat (i, j))) i j) =
                                        setElement mat (i, j) (Element possible (getRegion (getElement mat (i, j))) i j)
                                     | otherwise = (testaTudo mat (i, j) (possible-1))

-- checa posicao invalida encontrada para iniciar processo de tentativas
tryresolvevePos :: Matrix -> Pos -> Matrix
tryresolvevePos mat (-1, -1) = mat      -- erro (matriz pronta)
tryresolvevePos mat pos = testaTudo mat pos (lerRegiao mat (getElement mat pos))

-- resolveve matriz de kojun, termina se matriz mandada para o processo for igual a recebida
resolve :: Matrix -> Matrix
solve mat | ( compareMatrix mat (tryresolvevePos mat (buscaInvalido mat mat)) ) = mat
          | otherwise = solve (tryresolvevePos mat (buscaInvalido mat mat))
