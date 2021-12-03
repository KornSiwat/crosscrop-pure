module Services.CrossingBlock where

import           Errors.Definitions                  (Errors)

import           Services.CrossingMethod             (CrossingMethod)

import           Models.Germplasms.BreedingNursery   (BreedingNurseryGermplasm)
import           Models.Germplasms.Common.Attributes (GermplasmId)
import           Models.Germplasms.CrossingBlock     (CrossingBlockGermplasm)
import           Models.Workflow.CrossingBlock       (CrossingBlock)

fromBreedingNursery :: [BreedingNurseryGermplasm] -> CrossingMethod -> CrossingBlock
fromBreedingNursery = undefined

withdraw :: [GermplasmId] -> CrossingBlock -> Either Errors [CrossingBlockGermplasm]
withdraw = undefined
