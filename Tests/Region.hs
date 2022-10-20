module Tests.Region where

import Src.Matrix


-- checa se elemento existe na linha
temNaLinha :: [Element] -> Element -> Bool
temNaLinha [] candidate  = False
temNaLinha (e:row) candidate | ((getRegion candidate) == (getRegion e)) &&
                            ((getValue candidate) == (getValue e)) &&
                            not ( ((getI candidate) == (getI e)) && ((getJ candidate) == (getJ e)) ) = True
                        | otherwise = temNaLinha row candidate

-- Checa se elemento ja existe na regiao
temNaRegiao :: Matrix -> Element -> Bool
temNaRegiao [] candidate = False
temNaRegiao (row:mat) candidate | temNaLinha row candidate = True
                                   | otherwise = temNaRegiao mat candidate
