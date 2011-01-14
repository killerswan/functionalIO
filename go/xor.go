/* Kevin Cantu © 2011
   xor: read and XOR all bytes of a file together */

package main

import (
   "fmt"
   "os"
   "bufio"
)

var me string = "xor"

func perr (err os.Error) {
   fmt.Println(me, ":", err)
}

func main() {
   if len(os.Args) < 2 {
      fmt.Println("Usage: xor FILENAME")
      return
   }
   filename := os.Args[1]

   var result byte = 0

   var content byte
   var err os.Error

   file, err := os.Open(filename, os.O_RDONLY, 0666)
   if err != nil {
      perr(err)
      return
   }

   br := bufio.NewReader(file)
   //br := bufio.NewReader(os.Stdin)

   for {
      content, err = br.ReadByte()
      if err != nil {
         perr(err)
         break
      }
      result ^= content
   }

   fmt.Printf("Go XOR of \"%s\": %d\n", filename, result)
}
