import System
import Bits
import Data.List
import Data.ByteString as B

main =
    Prelude.putStr "Haskell XOR of bytes (eager): "
    >> getArgs
    >>= B.readFile . Data.List.head
    >>= print . B.foldl xor 0

