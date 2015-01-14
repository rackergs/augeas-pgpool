(*
Module: Test_Pgpool_Passwd
  Provides unit tests and examples for the <Pgpool_Passwd> lense.
*)

module Test_Pgpool_Passwd =

(* View: conf *)
let conf = "myuser:foobar
otheruser:md503e940f7151fe45672c0eb2b203ac698
"

test Pgpool.lns get conf =
  { "myuser" = "foobar" }
  { "otheruser" = "md503e940f7151fe45672c0eb2b203ac698" }
