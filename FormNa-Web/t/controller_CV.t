use strict;
use warnings;
use Test::More;


use Catalyst::Test 'FormNa::Web';
use FormNa::Web::Controller::CV;

ok( request('/cv')->is_success, 'Request should succeed' );
done_testing();
