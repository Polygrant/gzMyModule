use gzMyModule::gzMyModuleImpl;

use gzMyModule::gzMyModuleServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = gzMyModule::gzMyModuleImpl->new;
    push(@dispatch, 'gzMyModule' => $obj);
}


my $server = gzMyModule::gzMyModuleServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
