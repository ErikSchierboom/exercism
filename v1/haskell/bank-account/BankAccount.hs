module BankAccount (BankAccount, openAccount, closeAccount, getBalance, incrementBalance) where

import Control.Applicative ((<$>))
import Control.Concurrent.STM (TVar, newTVar, readTVar, writeTVar, atomically)

type Balance = Maybe Int
newtype BankAccount = BankAccount { unBankAccount :: TVar Balance }

openAccount :: IO BankAccount
openAccount = atomically $ BankAccount <$> newTVar (Just 0)

getBalance :: BankAccount -> IO Balance
getBalance = atomically . readTVar . unBankAccount

closeAccount :: BankAccount -> IO ()
closeAccount = atomically . flip writeTVar Nothing . unBankAccount

incrementBalance :: BankAccount -> Int -> IO Balance
incrementBalance bankAccount amount = atomically $ do
	currentBalance <- readTVar $ unBankAccount bankAccount
	case currentBalance of
		Just balance -> do
			let newBalance = Just $! balance + amount
			writeTVar (unBankAccount bankAccount) newBalance
			return newBalance
		Nothing -> return Nothing