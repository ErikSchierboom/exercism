{-# LANGUAGE TemplateHaskell #-}

module Person where

import           Data.Time.Calendar
import           Control.Lens

data Person = Person {
      _name    :: Name,
      _born    :: Born,
      _address :: Address
    }

data Name = Name {
      _foreNames :: String, -- Space separated
      _surName   :: String
    }

data Born = Born {
      _bornAt :: Address,
      _bornOn :: Day
    }

data Address = Address {
      _street      :: String,
      _houseNumber :: Int,
      _place       :: String, -- Village / city
      _country     :: String
    }

-- Valid values of Gregorian are those for which 'Data.Time.Calendar.fromGregorianValid'
-- returns Just.
data Gregorian = Gregorian {
      _year  :: Integer,
      _month :: Int,
      _day   :: Int
    }

-- Implement these.

makeLenses ''Person
makeLenses ''Name
makeLenses ''Born
makeLenses ''Address
makeLenses ''Day
makeLenses ''Gregorian

bornStreet :: Born -> String
bornStreet = view (bornAt . street) 

setCurrentStreet :: String -> Person -> Person
setCurrentStreet = set (address . street)

setBirthMonth :: Int -> Person -> Person
setBirthMonth newMonth = over (born . bornOn) (setMonth newMonth)
    
setMonth :: Int -> Day -> Day
setMonth newMonth oldDay = fromGregorian y newMonth d 
    where (y, _, d) = toGregorian oldDay

-- | Transform both birth and current street names.
renameStreets :: (String -> String) -> Person -> Person
renameStreets x = over (born . bornAt . street) x . over (address . street) x