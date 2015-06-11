{-# LANGUAGE TypeSynonymInstances , FlexibleInstances #-}

module HMeans.Train where

import HMeans.Util
import HMeans.Data
import HMeans.Common
import HMeans.Algebra


import Data.Foldable


import qualified Data.IntSet as ISet
import qualified Data.Map.Strict as Map
import qualified Data.IntMap.Strict as IMap


import Debug.Trace



trainDataPoint :: (Vector v, Data d) => Partition v -> d v -> Partition v
trainDataPoint base d = Partition $ IMap.singleton i c
  where 
    c = toCluster d
    i = closestCluster (getPartition base) c

train :: Vector v => [Partition v] -> Partition v
train = foldl' plus zero