-module(pocket).

-export([take/1, put/2]).

take(Key) ->
    pocket_data:get(Key).

put(Key, Value) ->
    pocket_data:set(Key, Value),
    pocket_link:broadcast(Key, Value).
