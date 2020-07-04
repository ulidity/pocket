%%%-------------------------------------------------------------------
%% @doc pocket top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(pocket_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags = #{
      strategy => one_for_one, intensity => 1, period => 10
    },
    ChildSpecs = [
        #{id => pocket_watch, start => {pocket_watch, start_link, []}},
        #{id => pocket_data, start => {pocket_data, start_link, []}}
    ],
    {ok, {SupFlags, ChildSpecs}}.
