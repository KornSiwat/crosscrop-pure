{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Germplasms.ColdRoom where

import           Prelude                              hiding (id)

import           Control.Lens                         (makeFieldsNoPrefix)
import           Data.Map                             (empty)

import qualified Configs.Germplasm                    as Config

import           Errors.Definitions                   (Errors)

import           Helpers.Validator                    (isValid)

import           Models.Germplasms.Common.Attributes  (Attributes,
                                                       GermplasmCount (GermplasmCount),
                                                       GermplasmId (GermplasmId),
                                                       GermplasmName (GermplasmName))
import           Models.Germplasms.Common.Definitions (Germplasm)

-- ColdRoom Germplasm
data ColdRoomGermplasm =
    ColdRoomGermplasm
        { _germplasm :: Germplasm
        , _count     :: GermplasmCount
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''ColdRoomGermplasm

makeColdRoomGermplasm :: Germplasm -> GermplasmCount -> ColdRoomGermplasm
makeColdRoomGermplasm x y = ColdRoomGermplasm {_germplasm = x, _count = y}
