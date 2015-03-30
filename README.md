rebar_edown_plugin
==================

A rebar3 plugin for `edown`.

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        {rebar_edown_plugin, ".*", {git, "git@host:user/rebar_edown_plugin.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:

    $ rebar3 edown
    ===> Fetching rebar_edown_plugin
    ===> Compiling rebar_edown_plugin
    Running edoc for myapp
