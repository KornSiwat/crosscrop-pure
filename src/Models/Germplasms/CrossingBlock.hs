{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Germplasms.CrossingBlock where

import           Prelude                              hiding (id)

import           Control.Lens                         (makeFieldsNoPrefix)
import           Data.Map                             (empty)

import qualified Configs.Germplasm                    as Config

import           Errors.Definitions                   (Errors)

import           Helpers.Validator                    (isValid)

import           Models.Germplasms.Common.Attributes  (Attributes,
                                                       GermplasmId (GermplasmId),
                                                       GermplasmName (GermplasmName))
import           Models.Germplasms.Common.Definitions (FemaleGermplasm,
                                                       Germplasm, MaleGermplasm)

-- CrossingBlock Germplasm
data CrossingBlockGermplasm =
    CrossingBlockGermplasm
        { _germplasm       :: Germplasm
        , _femaleGermplasm :: FemaleGermplasm
        , _maleGermplasm   :: MaleGermplasm
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''CrossingBlockGermplasm

makeCrossingBlockGermplasm :: Germplasm -> FemaleGermplasm -> MaleGermplasm -> CrossingBlockGermplasm
makeCrossingBlockGermplasm x y z = CrossingBlockGermplasm {_germplasm = x, _femaleGermplasm = y, _maleGermplasm = z}
