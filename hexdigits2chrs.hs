#!/usr/bin/env runhaskell

import Data.Char (chr, digitToInt)
import System.IO
import System.Environment

-- | main function
main :: IO ()
main = do
    cmd <- getProgName
    args <- getArgs
    case args of
        [] -> putStrLn $ "usage: " ++ cmd ++ " <string>"
        l  -> putStrLn $ unwords $ map hexdigits2chrs l

-- | helpers
hexdigits2ords [] = []
hexdigits2ords (a:b:l)
    = [digitToInt a * 16 + digitToInt b] ++ hexdigits2ords l

hexdigits2chrs l = map chr $ hexdigits2ords l
