use strict;
use warnings;
use Test::More;


use Catalyst::Test 'FormNa::Web';
use FormNa::Web::Controller::Notice;

ok( request('/notice')->is_success, 'Request should succeed' );
done_testing();
