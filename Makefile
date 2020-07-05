compile:
	@ rebar3 compile

shell:
	@ rebar3 as dev shell --sname $(NODE)@localhost

dialyzer:
	@ rebar3 dialyzer
