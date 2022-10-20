module Tests.Upper where

import Src.Matrix

temCimaEBaixo :: Matrix -> Element -> Bool
temCimaEBaixo mat e | ( ((getI e) /= 0) && ((getRegion e) == (getRegion (getElement mat ((getI e)-1, getJ e))) ) ) = ( (getValue (getElement mat ((getI e)-1, getJ e))) < (getValue e))
                    | otherwise = False
