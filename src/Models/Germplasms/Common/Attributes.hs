module Models.Germplasms.Common.Attributes where

import           Control.Lens       (makeLenses)
import           Data.Map           (Map)
import           Data.Time          (UTCTime)
import           Data.Time.Calendar (Day)

-- Basic Attributes
newtype GermplasmId =
    GermplasmId String
    deriving (Show, Eq)

newtype GermplasmName =
    GermplasmName String
    deriving (Show, Eq)

newtype AttributeName =
    AttributeName String
    deriving (Show, Eq, Ord)

data AttributeValue
    = AttributeString String
    | AttributeInt Int
    | AttributeDouble Double
    | AttributeBool Bool
    | AttributeDateTime UTCTime
    | AttributeDate Day
    deriving (Show, Eq)

type Attributes = Map AttributeName AttributeValue

-- Specific Attributes
newtype GermplasmCount =
    GermplasmCount Int
    deriving (Show, Eq)

newtype Plot =
    Plot String
    deriving (Show, Eq)
