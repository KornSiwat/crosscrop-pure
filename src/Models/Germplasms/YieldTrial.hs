{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Germplasms.YieldTrial where

import           Prelude                              hiding (id)

import           Control.Lens                         (makeFieldsNoPrefix)
import           Data.Map                             (empty)

import qualified Configs.Germplasm                    as Config

import           Errors.Definitions                   (Errors)

import           Helpers.Validator                    (isValid)

import           Models.Germplasms.Common.Attributes  (Attributes,
                                                       GermplasmId (GermplasmId),
                                                       GermplasmName (GermplasmName),
                                                       Plot (Plot))
import           Models.Germplasms.Common.Definitions (Germplasm)

-- YieldTrial Germplasm
data YieldTrialGermplasm =
    YieldTrialGermplasm
        { _germplasm :: Germplasm
        , _plot      :: Plot
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''YieldTrialGermplasm

makeYieldTrialGermplasm :: Germplasm -> Plot -> YieldTrialGermplasm
makeYieldTrialGermplasm x y = YieldTrialGermplasm {_germplasm = x, _plot = y}
