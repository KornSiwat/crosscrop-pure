{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Workflow.ColdRoom where

import           Control.Lens                      (makeFieldsNoPrefix)

import           Models.Germplasms.ColdRoom        (ColdRoomGermplasm)
import           Models.Workflow.Common.Attributes (WorkflowId)

-- ColdRoom
data ColdRoom =
    ColdRoom
        { _id         :: WorkflowId
        , _germplasms :: [ColdRoomGermplasm]
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''ColdRoom

makeColdRoom :: WorkflowId -> [ColdRoomGermplasm] -> ColdRoom
makeColdRoom = ColdRoom
