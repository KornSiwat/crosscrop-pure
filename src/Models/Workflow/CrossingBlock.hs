{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Workflow.CrossingBlock where

import           Control.Lens                      (makeFieldsNoPrefix)

import           Models.Germplasms.CrossingBlock   (CrossingBlockGermplasm)
import           Models.Workflow.Common.Attributes (Season, WorkflowId)

-- CrossingBlock
data CrossingBlock =
    CrossingBlock
        { _id         :: WorkflowId
        , _season     :: Season
        , _germplasms :: [CrossingBlockGermplasm]
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''CrossingBlock

makeCrossingBlock :: WorkflowId -> Season -> [CrossingBlockGermplasm] -> CrossingBlock
makeCrossingBlock = CrossingBlock
