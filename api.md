# Archtec API

This file is maybe outdated.

It only documents global API functions, not locals!

Note:

`name` is always a player name

`player` is always a PlayerRef



## Common API


### archtec.get_target

Returns `target` (if valid) or `name`

- `name` Must be a valid playername

- `target` Any value

```lua
archtec.get_target(name, target)
```


### archtec.is_online

Returns if `name` is online

- `name` Must be a valid playername

```lua
archtec.is_online(name)
```


### archtec.grant_priv

Grants `name` the priv `priv`

- `name` Must be a valid playername

- `priv` Any string

```lua
archtec.grant_priv(name, priv)
```


### archtec.revoke_priv

Revokes `name` the priv `priv`

- `name` Must be a valid playername

- `priv` Any string

```lua
archtec.revoke_priv(name, priv)
```


### archtec.get_modname_by_itemname

Returns the `modname` from `itemname`

- `itemname` Must be a minetest conform `ItemString`

```lua
archtec.get_modname_by_itemname(itemname)
```


### archtec.string_to_table

Returns a table generated from a sequence of strings

- `str` A sequence of strings in a string, seperated by `delim`

- `delim` Seperator for `str`, defaults to `,`

```lua
archtec.string_to_table(str, delim)
```


### archtec.get_block_bounds

Returns the mapblock bounds of `pos`

- `pos` A valid (x,y,z) pos

```lua
archtec.get_block_bounds(pos)
```


### archtec.count_keys

Returns the amount of keys of the given table `table`

- `table` Must be a valid table

```lua
archtec.count_keys(table)
```


### archtec.table_contains

Checks if the value `element` is in the table `table`

- `table` Must be a valid table

- `element` The value to be checked

```lua
archtec.table_contains(table, element)
```



## Player ignore API


### archtec.is_ignored

Checks if `name` ignores `target` or `target` ignores `name`

- `name` Must be a valid playername

- `target` Must be a valid playername

```lua
archtec.is_ignored(name, target)
```


### archtec.ignore_msg

Sends `name` a notifcation that he/she/it is blocked/blocks someone

- `cmdname` Name of the chatcommand which has called `ignore_msg()`

- `name` The player who should receive the message

- `target` The second playername (for `is_ignored()` checks)

```lua
archtec.ignore_msg(cmdname, name, target)
```



## Music API


### music.play

Plays `title` to `name`

- `name` Must be a valid playername

- `title` Must be a song file in `worldpath/music/`

```lua
music.play(name, title)
```


### music.stop

Stops music for `name`

- `name` Must be a valid playername

```lua
music.stop(name)
```



## Logging API


### notifyTeam

Sends `message` to all staff members and Discord when `dc` is true

- `message` A string

- `dc` true/false, if true (default), message is sent to Discord

```lua
notifyTeam(message, dc)
```



## Ranks API


### archtec.ranks_update_nametag

Updates `player`'s nametag

- `player` A valid PlayerRef

- `remove` Remove the rank from the nametag (defaults to `false`)

```lua
archtec.ranks_update_nametag(player, remove)
```