module Services.CrossingMethod where

import           Models.Germplasms.BreedingNursery (BreedingNurseryGermplasm)
import           Models.Germplasms.CrossingBlock   (CrossingBlockGermplasm)

type CrossingMethod = ([BreedingNurseryGermplasm] -> [CrossingBlockGermplasm])

normalCross :: CrossingMethod
normalCross = undefined

specialCross :: CrossingMethod
specialCross = undefined
