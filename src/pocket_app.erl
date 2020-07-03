%%%-------------------------------------------------------------------
%% @doc pocket public API
%% @end
%%%-------------------------------------------------------------------

-module(pocket_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    pocket_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
