use inc::Module::Install;

name     'JSON-Assert';
all_from 'lib/JSON/Assert.pm';
author   'Andrew Ruthven <andrew@etc.gen.nz>';
repository 'git://github.com/catalyst/JSON-Assert';

perl_version '5.010_000';

requires        "Any::Moose" => 0;
requires        "JSON::Path" => 0;

build_requires 'Test::More';
build_requires 'Test::Builder::Tester';
test_requires 'Test::Exception';

include 'Test::Exception';
include 'Sub::Uplevel';

auto_install;

WriteAll;

