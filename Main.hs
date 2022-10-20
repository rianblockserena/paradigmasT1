-- principal

import Src.Matrix
import Src.Solver
import Src.Print
import Tests.Upper


main = do
  let m = newMatrix 6 6

  let m2 = setElement m (0, 2) (Element 4 2 0 2)
  let m3 = setElement m2 (0, 4) (Element 2 3 0 4)
  let m4 = setElement m3 (1, 2) (Element 3 2 1 2)
  let m5 = setElement m4 (2, 0) (Element 1 1 2 0)
  let m6 = setElement m5 (2, 1) (Element 4 1 2 1)
  let m7 = setElement m6 (2, 3) (Element 4 3 2 3)
  let m8 = setElement m7 (3, 1) (Element 5 9 3 1)
  let m9 = setElement m8 (3, 5) (Element 2 7 3 5)
  let m10 = setElement m9 (4, 4) (Element 3 11 4 4)
  let m11 = setElement m10 (5, 0) (Element 6 9 5 0)
  let m12 = setElement m11 (5, 1) (Element 2 9 5 1)
  let m13 = setElement m12 (5, 5) (Element 5 11 5 5)
  let m14 = setElement m13 (5, 3) (Element 2 11 5 3)

  -- antes
  printMatrix m14

  -- depois
  printMatrix ( solve m14 )
