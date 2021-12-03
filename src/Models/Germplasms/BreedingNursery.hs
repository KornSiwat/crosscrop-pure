{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Germplasms.BreedingNursery where

import           Prelude                              hiding (id)

import           Control.Lens                         (makeFieldsNoPrefix)
import           Data.Map                             (empty)

import qualified Configs.Germplasm                    as Config

import           Errors.Definitions                   (Errors)

import           Helpers.Validator                    (isValid)

import           Models.Germplasms.Common.Attributes  (Plot)
import           Models.Germplasms.Common.Definitions (Germplasm)

-- BreedingNursery Germplasm
data BreedingNurseryGermplasm =
    BreedingNurseryGermplasm
        { _germplasm :: Germplasm
        , _plot      :: Plot
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''BreedingNurseryGermplasm

makeBreedingNurseryGermplasm :: Germplasm -> Plot -> BreedingNurseryGermplasm
makeBreedingNurseryGermplasm x y = BreedingNurseryGermplasm {_germplasm = x, _plot = y}
