{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Workflow.BreedingNursery where

import           Control.Lens                      (makeFieldsNoPrefix)

import           Models.Germplasms.BreedingNursery (BreedingNurseryGermplasm)
import           Models.Workflow.Common.Attributes (Season,
                                                    WorkflowId (WorkflowId))

-- BreedingNursery
data BreedingNursery =
    BreedingNursery
        { _id         :: WorkflowId
        , _season     :: Season
        , _germplasms :: [BreedingNurseryGermplasm]
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''BreedingNursery

makeBreedingNursery :: WorkflowId -> Season -> [BreedingNurseryGermplasm] -> BreedingNursery
makeBreedingNursery = BreedingNursery
