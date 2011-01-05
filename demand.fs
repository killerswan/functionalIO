open System.IO

let filename = System.Environment.GetCommandLineArgs().[1]


let turtle f : int =
    use stream = new FileStream(f, FileMode.Open)
    use stream' = new BufferedStream(stream)
    
    let rec loop n : int =
        let b = stream'.ReadByte()
        if b >= 0 then loop (n ^^^ b) else n
    loop 0 

printfn "F# XOR of bytes (on demand): %d" <| turtle filename
