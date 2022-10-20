module Tests.Empty where

import Src.Matrix

-- testa se elemento eh vazio (sem valor)
elementoVazio :: Element -> Bool
elementoVazio e = ( (getValue e) == 0 )
