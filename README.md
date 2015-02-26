rot13_server
------------

It is a trivial server that listens for TCP connections on port 40713, reads data from its input one line at a time, and writes out the ROT13
obfuscation of line each as it arrives.

## Build and run

```
  $ make
  $ ./rot13_server &
  $ telnet localhost 40713

      or

  $ ruby rot13_client.rb 140

