module Tests.Adjacency where

import Src.Matrix

-- retorna vizinhos vizinahnca de 4)
pegaVizinhoCima :: Matrix -> Element -> Element      -- de cima
pegaVizinhoCima mat e | ( (getI e) == 0 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat (((getI e)-1), (getJ e)))

pegaVizinhoBaixo :: Matrix -> Element -> Element      -- de baixo
pegaVizinhoBaixo mat e | ( (getI e) == (length mat)-1 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat (((getI e)+1), (getJ e)))

pegaVizinhoEsquerda :: Matrix -> Element -> Element       -- da esquerda
pegaVizinhoEsquerda mat e | ( (getJ e) == 0 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat ((getI e), ((getJ e)-1)))

pegaVizinhoDireita :: Matrix -> Element -> Element      -- da direita
pegaVizinhoDireita mat e | ( (getJ e) == (length mat)-1 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat ((getI e), ((getJ e)+1)))


-- Checa se existe valores adjacentes iguais ao elemento (esquerda direita, cima e baixo)
hasEqAdjacenct :: Matrix -> Element -> Bool
hasEqAdjacenct mat e = ( ((getValue (pegaVizinhoCima mat e)) == (getValue e) ) ||
                          ((getValue (pegaVizinhoBaixo mat e)) == (getValue e) ) ||
                          ((getValue (pegaVizinhoEsquerda mat e)) == (getValue e) ) ||
                          ((getValue (pegaVizinhoDireita mat e)) == (getValue e) ) )
