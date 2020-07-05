-module(pocket_sup).

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    SupFlags = #{
      strategy => one_for_one, intensity => 1, period => 10
    },
    ChildSpecs = [
        #{id => pocket_data, start => {pocket_data, start_link, []}}
    ],
    {ok, {SupFlags, ChildSpecs}}.
