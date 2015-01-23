module BankAccount (BankAccount, openAccount, closeAccount, getBalance, incrementBalance) where

import Data.IORef
import Control.Applicative

type Balance = Maybe Int
newtype BankAccount = BankAccount { unBankAccount :: IORef Balance }

openAccount :: IO BankAccount
openAccount = BankAccount <$> newIORef (Just 0)

getBalance :: BankAccount -> IO Balance
getBalance = readIORef . unBankAccount

closeAccount :: BankAccount -> IO ()
closeAccount = flip setBalance Nothing

incrementBalance :: BankAccount -> Int -> IO Balance
incrementBalance bankAccount amount = do
	currentBalance <- getBalance bankAccount
	case currentBalance of
		Just balance -> do
			let newBalance = Just(balance + amount)
			setBalance bankAccount newBalance
			return newBalance
		Nothing -> return Nothing

setBalance :: BankAccount -> Balance -> IO ()
setBalance = writeIORef . unBankAccount