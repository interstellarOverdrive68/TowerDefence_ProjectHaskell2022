{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_haskell_codeworld_template (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\apps\\studyRelated\\compilers\\ghc\\cabal\\bin"
libdir     = "C:\\apps\\studyRelated\\compilers\\ghc\\cabal\\x86_64-windows-ghc-8.10.7\\haskell-codeworld-template-0.1.0-inplace"
dynlibdir  = "C:\\apps\\studyRelated\\compilers\\ghc\\cabal\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\apps\\studyRelated\\compilers\\ghc\\cabal\\x86_64-windows-ghc-8.10.7\\haskell-codeworld-template-0.1.0"
libexecdir = "C:\\apps\\studyRelated\\compilers\\ghc\\cabal\\haskell-codeworld-template-0.1.0-inplace\\x86_64-windows-ghc-8.10.7\\haskell-codeworld-template-0.1.0"
sysconfdir = "C:\\apps\\studyRelated\\compilers\\ghc\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_codeworld_template_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_codeworld_template_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_codeworld_template_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_codeworld_template_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_codeworld_template_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_codeworld_template_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
