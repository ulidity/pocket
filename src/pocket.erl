-module(pocket).

-export([take/1, put/2]).

take(Key) ->
    gen_server:call(pocket_data, {get, Key}).

put(Key, Value) ->
    gen_server:cast(pocket_data, {set, Key, Value}).
