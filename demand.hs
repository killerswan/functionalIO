import System
import Bits
import Data.List
import Data.ByteString.Lazy as B

main =
    Prelude.putStr "Haskell XOR of bytes (on demand): "
    >> getArgs
    >>= B.readFile . Data.List.head
    >>= print . B.foldl xor 0

