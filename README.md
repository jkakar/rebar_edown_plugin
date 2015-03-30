# rebar_edown_plugin

A rebar3 plugin for [edown](https://github.com/esl/edown).

## Build

```
$ rebar3 compile
```

## Use

Add the plugin to your `rebar.config`:

```erlang
{plugins, [
    {rebar_edown_plugin, ".*",
     {git, "git@host:user/rebar_edown_plugin.git", {tag, "0.1.0"}}}
]}.
```

Then run the plugin:

```
$ rebar3 edown
===> Fetching rebar_edown_plugin
===> Compiling rebar_edown_plugin
Running edown for myapp
```
