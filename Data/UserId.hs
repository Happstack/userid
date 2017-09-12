{-# LANGUAGE DeriveDataTypeable, DeriveGeneric, GeneralizedNewtypeDeriving, TemplateHaskell #-}
{- | This module provides a `UserId` type plus some useful instances for web development. -}
module Data.UserId where

import Control.Applicative ((<$>))
import Data.Aeson          (FromJSON(..), ToJSON(..), Result(..), fromJSON)
import Data.Data           (Data)
import Data.SafeCopy       (SafeCopy, base, deriveSafeCopy)
import Data.Serialize      (Serialize)
import Data.Typeable       (Typeable)
import GHC.Generics        (Generic)
import Text.Boomerang.TH   (makeBoomerangs)
import Web.Routes          (PathInfo(..))
import Web.Routes.TH       (derivePathInfo)

-- | a 'UserId' uniquely identifies a user.
newtype UserId = UserId { _unUserId :: Integer }
    deriving (Eq, Ord, Enum, Read, Show, Data, Typeable, Generic, Serialize)
deriveSafeCopy 1 'base ''UserId
-- makeLenses ''UserId
unUserId f (UserId x) = fmap UserId (f x)
{-# INLINE unUserId #-}
makeBoomerangs ''UserId

instance ToJSON   UserId where toJSON (UserId i) = toJSON i
instance FromJSON UserId where parseJSON v = UserId <$> parseJSON v

instance PathInfo UserId where
    toPathSegments (UserId i) = toPathSegments i
    fromPathSegments = UserId <$> fromPathSegments

-- | get the next `UserId`
succUserId :: UserId -> UserId
succUserId (UserId i) = UserId (succ i)
