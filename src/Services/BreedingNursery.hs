module Services.BreedingNursery where

import           Errors.Definitions                  (Errors)

import           Models.Germplasms.BreedingNursery   (BreedingNurseryGermplasm)
import           Models.Germplasms.ColdRoom          (ColdRoomGermplasm)
import           Models.Germplasms.Common.Attributes (GermplasmId)
import           Models.Workflow.BreedingNursery     (BreedingNursery)

fromColdRoom :: [ColdRoomGermplasm] -> BreedingNursery
fromColdRoom = undefined

fromBreedingNursery :: [BreedingNurseryGermplasm] -> BreedingNursery
fromBreedingNursery = undefined

withdraw :: [GermplasmId] -> BreedingNursery -> Either Errors [BreedingNurseryGermplasm]
withdraw = undefined
