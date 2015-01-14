(*
Module: Pgpool_passwd
  Parses pool_passwd

Author: Alex Schultz <aschultz@next-development.com>

About: Reference
   http://www.pgpool.net/docs/latest/pgpool-en.html#md5

About: Usage Example
(start code)
    augtool> set /augeas/load/Pgpool_Passwd_Passwd/lens "Pgpool.lns"
    augtool> set /augeas/load/Pgpool_Passwd/incl "/etc/pgpool/pool_passwd"
    augtool> load

    augtool> get /files/etc/pgpool/pool_passwd/myuser
    /files/etc/pgpool/pool_passwd/myuser = 

    augtool> set /files/etc/pgpool/pool_passwd/myuser foobar
    augtool> save
    Saved 1 file(s)

    $ grep myuser /etc/pgpool/pool_passwd
    myuser:foobar
(end code)

About: Configuration files
   This lens applies to pool_passwd files. See <filter>.

About: Examples
   The <Test_Pgpool_Passwd> file contains various examples and tests.
*)


module Pgpool_Passwd =
  autoload xfm

(* View: entry *)
let entry = Build.key_value_line Rx.word Sep.colon (store Rx.space_in)

(* View: lns *)
let lns = (Util.empty | Util.comment | entry)*

(* Variable: filter *)
let filter = incl "/etc/pgpool/pool_passwd"
           . incl "/etc/pgpool-II-*/pool_passwd"
           . incl "/etc/pgpool2/pool_passwd"


let xfm = transform lns filter

