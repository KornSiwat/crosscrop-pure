{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module Models.Germplasms.Common.Definitions where

import           Prelude                             hiding (id)

import           Control.Lens                        (makeFieldsNoPrefix)
import           Data.Map                            (empty)

import qualified Configs.Germplasm                   as Config

import           Errors.Definitions                  (Errors)

import           Helpers.Validator                   (isValid)

import           Models.Germplasms.Common.Attributes (Attributes,
                                                      GermplasmId (GermplasmId),
                                                      GermplasmName (GermplasmName))

-- Germplasm
data Germplasm =
    Germplasm
        { _id         :: GermplasmId
        , _name       :: GermplasmName
        , _attributes :: Attributes
        }
    deriving (Show, Eq)

makeFieldsNoPrefix ''Germplasm

makeGermplasm :: GermplasmId -> GermplasmName -> Attributes -> Either Errors Germplasm
makeGermplasm x y zs = Right Germplasm {_id = x, _name = y, _attributes = zs}

-- Female Germplasm
newtype FemaleGermplasm =
    FemaleGermplasm Germplasm
    deriving (Show, Eq)

makeFemaleGermplasm :: Germplasm -> FemaleGermplasm
makeFemaleGermplasm = FemaleGermplasm

-- Male Germplasm
newtype MaleGermplasm =
    MaleGermplasm Germplasm
    deriving (Show, Eq)

makeMaleGermplasm :: Germplasm -> MaleGermplasm
makeMaleGermplasm = MaleGermplasm
