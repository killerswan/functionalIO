open System.IO

let filename = System.Environment.GetCommandLineArgs().[1]

let hare f : byte = 
    f
    |> File.ReadAllBytes
    |> Array.fold (^^^) 0uy

printfn "F# XOR of bytes (eager): %d" <| hare filename
