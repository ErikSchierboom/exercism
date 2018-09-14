module Deque (mkDeque, push, pop, shift, unshift) where

import Control.Applicative ((<$>), (<*>))
import Control.Concurrent.STM (STM, TMVar, newTMVar, newEmptyTMVar, readTMVar, putTMVar, swapTMVar, atomically)
import Control.Monad (void)

data Element a = Element { val :: a, prev :: TMVar (Element a), next :: TMVar (Element a) }
newtype Deque a = Deque { unDeque :: TMVar (Maybe (Element a)) }

mkDeque :: IO (Deque a)
mkDeque = atomically $ Deque <$> newTMVar Nothing

mkElement :: a -> STM (Element a)
mkElement value = Element value <$> newEmptyTMVar <*> newEmptyTMVar

mkFirstElement :: a -> STM (Element a)
mkFirstElement value = do
    firstElement <- mkElement value
    putTMVar (prev firstElement) firstElement
    putTMVar (next firstElement) firstElement
    return firstElement

setFirstElement :: Deque a -> a -> STM ()
setFirstElement deque value = void $ mkFirstElement value >>= swapTMVar (unDeque deque) . Just

insertBefore :: Element a -> a -> STM (Element a)
insertBefore element value = do
    newElement <- mkElement value
    prev' <- swapTMVar (prev element) newElement
    void $ swapTMVar (next prev') newElement
    putTMVar (next newElement) element
    putTMVar (prev newElement) prev'
    return newElement

push :: Deque a -> a -> IO ()
push deque value = atomically $ do
    maybeFirst <- readTMVar $ unDeque deque
    case maybeFirst of
        Just first -> void $ insertBefore first value
        Nothing -> setFirstElement deque value

unshift :: Deque a -> a -> IO ()
unshift deque value = atomically $ do
    let deque' = unDeque deque
    maybeFirst <- readTMVar deque'
    case maybeFirst of
        Just first -> do
            newElement <- insertBefore first value
            void $ swapTMVar deque' $ Just newElement
        Nothing -> setFirstElement deque value

pop :: Deque a -> IO (Maybe a)
pop deque = atomically $ do 
    maybeFirst <- readTMVar $ unDeque deque
    case maybeFirst of
        Just first -> do
            last' <- readTMVar (prev first)
            void $ readTMVar (prev last') >>= swapTMVar (prev first)
            return $ Just (val last')
        Nothing -> return Nothing
        
shift :: Deque a -> IO (Maybe a)
shift deque = atomically $ do 
    let deque' = unDeque deque
    maybeFirst <- readTMVar deque'
    case maybeFirst of
        Just first -> do
            last' <- readTMVar (prev first)
            next' <- readTMVar (next first)
            void $ swapTMVar (next last') next'
            void $ swapTMVar (prev next') last'
            void $ swapTMVar deque' (Just next')
            return $ Just (val first)
        Nothing -> return Nothing