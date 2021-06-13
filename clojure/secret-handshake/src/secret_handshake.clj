(ns secret-handshake)

(def coded-commands
  {
     0 #(conj % "wink")
     1 #(conj % "double blink")
     2 #(conj % "close your eyes")
     3 #(conj % "jump")
     4 reverse
   })

(defn- update-commands [code commands [command-nth-bit command]]
  (if (bit-test code command-nth-bit) (command commands) commands))

(defn commands [code]
  (reduce (partial update-commands code) [] coded-commands))
