-module(pocket_link).

-export([broadcast/2]).

broadcast(Key, Value) ->
    erpc:multicast(nodes(), pocket_data, set, [Key, Value]).
