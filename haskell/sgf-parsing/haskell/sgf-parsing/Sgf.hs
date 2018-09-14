{-# LANGUAGE OverloadedStrings #-}

module Sgf (parseSgf) where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Char (isUpper, isSpace)
import Data.Tree
import Data.Text (Text, pack)
import Control.Applicative (some)
import Control.Monad (void)
import Data.Attoparsec.Text

parseSgf :: Text -> Maybe (Tree (Map Text [Text]))
parseSgf = maybeResult . parse treeParser

type SgfTree = Tree SgfNode
type SgfNode = Map Text [Text]

treeParser :: Parser SgfTree
treeParser = do
	void $ char '('
	nodes <- some nodeParser
	trees <- many' treeParser
	void $ char ')'
	return (nodesToTree nodes trees)

nodeParser :: Parser SgfNode
nodeParser = do
	void $ char ';'
	properties <- many' propertyParser
	return (Map.fromList properties)

propertyParser :: Parser (Text, [Text])
propertyParser = do
	key <- some (satisfy isUpper)
	values <- some valueParser
	return (pack key, values)

valueParser :: Parser Text
valueParser = do	
	void $ char '['
	value <- valueTextParser "" '['
	return value

valueTextParser :: String -> Char -> Parser Text
valueTextParser acc previous = do
	current <- anyChar
	case (current, previous) of 
		(']', '\\')  -> valueTextParser (']' : acc) current
		(']', _)     -> return (pack $ reverse acc)
		('\n', '\\') -> valueTextParser (acc) current
		('\n', _)    -> valueTextParser (' ' : acc) current
		('\\', '\\') -> valueTextParser ('\\' : acc) current
		('\\', _)    -> valueTextParser acc current
		_            -> if isSpace current then 
				            valueTextParser (' ' : acc) current
			            else 
			 	            valueTextParser (current : acc) current

nodesToTree :: [SgfNode] -> [SgfTree] -> SgfTree
nodesToTree [] _ = error "Can only create tree from non-empty nodes list"
nodesToTree [x] trees = Node x trees
nodesToTree (x:xs) trees = Node x [nodesToTree xs trees]