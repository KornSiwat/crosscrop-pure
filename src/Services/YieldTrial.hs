module Services.YieldTrial where

import           Errors.Definitions                  (Errors)

import           Models.Germplasms.Common.Attributes (GermplasmId)
import           Models.Germplasms.CrossingBlock     (CrossingBlockGermplasm)
import           Models.Germplasms.YieldTrial        (YieldTrialGermplasm)
import           Models.Workflow.YieldTrial          (YieldTrial)

fromCrossingBlock :: [CrossingBlockGermplasm] -> YieldTrial
fromCrossingBlock = undefined

withdraw :: [GermplasmId] -> YieldTrial -> Either Errors [YieldTrialGermplasm]
withdraw = undefined
