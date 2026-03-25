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
tag=v0.0.1
asset_name=unpot_test_v0.0.1.zip
repository=https://github.com/pb-shrugged/unpot_test_framework
```

## How to use it in my project?

1. We recommend to create a new test target and application.
2. Add the unpot_test.pbl or unpot_test.pbd to your library list.
3. Add the the following keys to the unpot.config.ini file: `test_target_path=.\src\test.pbt` and `pattern_test_method=utm_*`, obviously set the values the way you like.
4. Define the following global variable: `unpot_test_application gn_unpot_test_application`.
5. Add the following script to your systemerror event of the test application `gn_unpot_test_application.systemerror(error)`.
6. Inherit from unpot_test_suite to create suites and add test cases in the constructor with unpot_test_suite.add_test_case(unpot_test_case)
7. Inherit from unpot_test_case to create test cases and create method following the pattern set in the unpot.config.ini file.
8. Both unpot_test_suite and unpot_test_case have setup() and teardown() methods that you can override and it will be executed before and after each suite and case
9. Run the all test with `unpot test` or some specific test you would like with `unpot test -s suite_test_* -c case_test_* -m method_test*`

## How build the .pbl files from the source code

```pwsh
unpot compile-pbl -f
```

## How to generate the .pbd files myself

```pwsh
unpot build --pbd
```
