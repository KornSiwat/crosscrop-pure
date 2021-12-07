module MainFlow where

import           Prelude                             hiding (id)

import           Control.Lens                        ((^.))
import           Control.Lens.Lens                   ((??))
import           Control.Monad                       (liftM2, liftM3)

import           Errors.Definitions                  (Errors)

import           Models.Germplasms.Common.Attributes (GermplasmId)
import           Models.Workflow.BreedingNursery     (BreedingNursery)
import           Models.Workflow.ColdRoom            (ColdRoom)
import           Models.Workflow.Common.Attributes   (Season)
import           Models.Workflow.CrossingBlock       (CrossingBlock)
import           Models.Workflow.YieldTrial          (YieldTrial)

import qualified Services.BreedingNursery            as BN
import qualified Services.ColdRoom                   as CR
import qualified Services.CrossingBlock              as CB
import           Services.CrossingMethod             (CrossingMethod)
import qualified Services.YieldTrial                 as YT

coldRoomToBreedingNursery ::
     [GermplasmId] -> Season -> ColdRoom -> Either Errors BreedingNursery
coldRoomToBreedingNursery xs y z =
  BN.fromColdRoom <$> germplasmFromColdRoom ?? y
  where
    germplasmFromColdRoom = CR.withdraw xs z

breedingNurseryToBreedingNursery ::
     [GermplasmId] -> Season -> BreedingNursery -> Either Errors BreedingNursery
breedingNurseryToBreedingNursery xs y z =
  BN.fromBreedingNursery <$> germplasmFromBreedingNursery ?? y
  where
    germplasmFromBreedingNursery = BN.withdraw xs z

breedingNurseryToCrossingBlock ::
     [GermplasmId]
  -> CrossingMethod
  -> Season
  -> BreedingNursery
  -> Either Errors CrossingBlock
breedingNurseryToCrossingBlock xs f y z =
  liftM3
    CB.fromBreedingNursery
    germplasmFromBreedingNursery
    crossingMethod
    (pure y)
  where
    germplasmFromBreedingNursery = BN.withdraw xs z
    crossingMethod = pure f

crossingBlockToYieldTrial ::
     [GermplasmId] -> Season -> CrossingBlock -> Either Errors YieldTrial
crossingBlockToYieldTrial xs y z =
  YT.fromCrossingBlock <$> germplasmFromCrossingBlock ?? y
  where
    germplasmFromCrossingBlock = CB.withdraw xs z
