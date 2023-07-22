"""
Helper funtions for building the project correctly.
"""

load("@aspect_rules_js//js:defs.bzl", "js_run_devserver")
load("@npm//:react-scripts/package_json.bzl", "bin")

def cra_run_devserver(name, args, **kwargs):
    js_run_devserver(
        name = name,
        args = args,
        chdir = native.package_name(),
        **kwargs,
    )

def cra_bin_react_scripts(name, args, **kwargs):
    bin.react_scripts(
        name = name,
        args = args,
        chdir = native.package_name(),
        **kwargs,
    )