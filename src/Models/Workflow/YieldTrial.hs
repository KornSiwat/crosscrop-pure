{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Workflow.YieldTrial where

import           Control.Lens                      (makeFieldsNoPrefix)

import           Models.Germplasms.YieldTrial      (YieldTrialGermplasm)
import           Models.Workflow.Common.Attributes (Season, WorkflowId)

-- YieldTrial
data YieldTrial =
    YieldTrial
        { _id         :: WorkflowId
        , _season     :: Season
        , _germplasms :: [YieldTrialGermplasm]
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''YieldTrial

makeYieldTrial :: WorkflowId -> Season -> [YieldTrialGermplasm] -> YieldTrial
makeYieldTrial = YieldTrial
