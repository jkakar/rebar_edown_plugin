-module(rebar_edown_plugin).
-behaviour(provider).

-export([init/1,
         do/1,
         format_error/1]).

-define(PROVIDER, edown).
-define(DEPS, [app_discovery]).

%% ===================================================================
%% Public API
%% ===================================================================

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
        {name, ?PROVIDER},        % The 'user friendly' name of the task
        {module, ?MODULE},        % The module implementation of the task
        {bare, true},             % The task can be run by the user, always true
        {deps, ?DEPS},            % The list of dependencies
        {example, "rebar edown"}, % How to use the plugin
        {opts, []},               % list of options understood by the plugin
        {short_desc, "A rebar plugin for edown"},
        {desc, ""}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.

-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    ProjectApps = rebar_state:project_apps(State),
    DefaultEDocOpts = rebar_state:get(State, edoc_opts, []),
    EDocOpts = [{doclet, edown_doclet} | DefaultEDocOpts],
    lists:foreach(fun(AppInfo) ->
                          AppName = ec_cnv:to_list(rebar_app_info:name(AppInfo)),
                          rebar_log:log(info, "Running edown for ~s", [AppName]),
                          ok = edoc:application(list_to_atom(AppName), EDocOpts)
                  end, ProjectApps),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).
