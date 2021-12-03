module Services.ColdRoom where

import           Errors.Definitions                  (Errors)

import           Models.Germplasms.ColdRoom          (ColdRoomGermplasm)
import           Models.Germplasms.Common.Attributes (GermplasmId)
import           Models.Workflow.ColdRoom            (ColdRoom)

withdraw :: [GermplasmId] -> ColdRoom -> Either Errors [ColdRoomGermplasm]
withdraw = undefined
