%% -------------------------------------------------------------------
%%
%% Copyright (c) 2007-2011 Basho Technologies, Inc.  All Rights Reserved.
%%
%% -------------------------------------------------------------------

-module(riak_moss_wm_bucket_test).

-export([bucket_test_/0]).

-include("riak_moss.hrl").
-include_lib("webmachine/include/webmachine.hrl").
-include_lib("eunit/include/eunit.hrl").

bucket_test_() ->
    {setup,
     fun riak_moss_wm_test_utils:setup/0,
     fun riak_moss_wm_test_utils:teardown/1,
     [fun create_bucket/0]}.

create_bucket() ->
    PathInfo = dict:from_list([{bucket, "create_bucket_test"}]),
    RD = #wm_reqdata{path_info = PathInfo},
    Ctx = #context{},

    {Result, _, _} = riak_moss_wm_bucket:to_json(RD, Ctx),
    ?assertEqual(mochijson2:encode([]), Result).
