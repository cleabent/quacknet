# my notes for using Quacknet

## lib/quacknet.lua

### Methods

open,close,isOpen => rednet methods

#### setRequestReplyTimeout(timeout|int)
Accepts int.
Replaces Request/Reply timeout with the parameter.

#### toggleDebug()
No parameters.
toggles `DEBUG`.

#### disableEncryption()
No parameters.
sets `NOENCRYPTION` to true. so it should.

#### version()
No parameters.
Returns constant "Quacknet 1.2"

#### send(target|int/string, data|any, encrypt|bool)
target: targetting computer. int for ID, string for hostnames.
data: Anything? tables will be serialised. It probably has limitations RedNet has, so you cannot send functions or something.
encrypt: Whether to send encrypted msg or not.

Sends message with quacknet. duh.

#### request(target|int/string, data|any, encrypt|bool)
target,data,encrypt is same as send().

sends to target like send(), returns :

on fail : { success = false, error = "No reply received" }
on success : { success = true, text = <Reply from otherside>, data = data(parameter) }

#### listen(computerID|int)
computerID : I think this is supposed to be your ID? 

Need to figure out handleServerReceived first.

#### handleServerReceived
(do params later)

Does something more from handleReceived? Needs check.

#### handleReceived
(do parans later)

This seems to handle received data, check if the msg is registered in quackkeys, decrypts it and returns the msg? I think it is.


*TODO : Load it manually without `startup.lua`?*
*TODO 2 : Quacknet only works on Wireless modem?*
I assume Quacknet is only for wirelesses 
because it's "unneccesary" to run it through encryption, signing and whatnot
on wired networks? imo you can just attach a computer to the wire..
We probably could modify startup so it just disables encryption

