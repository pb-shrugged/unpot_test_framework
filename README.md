# unpot_test_framework

This is the the standard test framework for the unpot build system for your powerbuilder application.
It follows the xUnit test architeture.
It uses unpot as the build system.

## How to use it as a dependency in my project?

Add it to your [deps] section in your unpot.config.ini file

```ini
[deps]
pb-shrugged/unpot_test_framework
```

Now add it to your unpot.deps.ini

```ini
[pb-shrugged/unpot_test_framework]
tag=0.0.1
asset_name=unpot_test_v0.0.1.zip
repository=https://github.com/pb-shrugged/unpot_test_framework
```

## How build the .pbl files from the source code

```pwsh
unpot compile-pbl -f
```

## How to generate the .pbd files myself

```pwsh
unpot build --pbd
```
