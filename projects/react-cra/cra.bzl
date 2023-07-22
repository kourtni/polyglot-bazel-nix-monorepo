"""
Helper funtions for building the project correctly.
"""

load("@aspect_rules_js//js:defs.bzl", "js_run_devserver")

def cra_run_devserver(name, args, **kwargs):
    js_run_devserver(
        name = name,
        args = args,
        chdir = native.package_name(),
        **kwargs
    )