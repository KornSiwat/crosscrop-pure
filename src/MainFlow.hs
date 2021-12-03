module MainFlow where

import           Control.Monad                       (liftM2)
import           Prelude                             hiding (id)

import           Control.Lens                        ((^.))

import           Errors.Definitions                  (Errors)

import           Models.Germplasms.Common.Attributes (GermplasmId)
import           Models.Workflow.BreedingNursery     (BreedingNursery)
import           Models.Workflow.ColdRoom            (ColdRoom)
import           Models.Workflow.CrossingBlock       (CrossingBlock)
import           Models.Workflow.YieldTrial          (YieldTrial)

import qualified Services.BreedingNursery            as BN
import qualified Services.ColdRoom                   as CR
import qualified Services.CrossingBlock              as CB
import           Services.CrossingMethod             (CrossingMethod)
import qualified Services.YieldTrial                 as YT

coldRoomToBreedingNursery :: [GermplasmId] -> ColdRoom -> Either Errors BreedingNursery
coldRoomToBreedingNursery xs y = BN.fromColdRoom <$> germplasmFromColdRoom
  where
    germplasmFromColdRoom = CR.withdraw xs y

breedingNurseryToBreedingNursery :: [GermplasmId] -> BreedingNursery -> Either Errors BreedingNursery
breedingNurseryToBreedingNursery xs y = BN.fromBreedingNursery <$> germplasmFromBreedingNursery
  where
    germplasmFromBreedingNursery = BN.withdraw xs y

breedingNurseryToCrossingBlock :: [GermplasmId] -> BreedingNursery -> CrossingMethod -> Either Errors CrossingBlock
breedingNurseryToCrossingBlock xs y f = liftM2 CB.fromBreedingNursery germplasmFromBreedingNursery crossingMethod
  where
    germplasmFromBreedingNursery = BN.withdraw xs y
    crossingMethod = pure f

crossingBlockToYieldTrial :: [GermplasmId] -> CrossingBlock -> Either Errors YieldTrial
crossingBlockToYieldTrial xs y = YT.fromCrossingBlock <$> germplasmFromCrossingBlock
  where
    germplasmFromCrossingBlock = CB.withdraw xs y
