-module(pocket_data).

-behaviour(gen_server).

-export([start_link/0]).
-export([init/1, handle_cast/2, handle_call/3, handle_info/2]).

-export([get/1, set/2]).

-define(POCKET_DATA_TABLE, pocket_data).


start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

get(Key) ->
    gen_server:call(?MODULE, {get, Key}).

set(Key, Value) ->
    gen_server:cast(?MODULE, {set, Key, Value}).

init([]) ->
    ets:new(?POCKET_DATA_TABLE, [named_table, {read_concurrency, true}]),
    {ok, {}}.

handle_call({get, Key}, _From, State) ->
    Reply = case ets:lookup(?POCKET_DATA_TABLE, Key) of
        [{Key, Value}] -> {ok, Value};
        [] -> empty
    end,
    {reply, Reply, State}.

handle_cast({set, Key, Value}, State) ->
    true = ets:insert(?POCKET_DATA_TABLE, {Key, Value}),
    {noreply, State}.

handle_info(_Msg, State) ->
    {noreply, State}.
