package MatchGame;
use strict;
use warnings;
use utf8;
our $VERSION='0.01';
use 5.008001;
use MatchGame::DB::Schema;
use MatchGame::DB;

use parent qw/Amon2/;
# Enable project local mode.
__PACKAGE__->make_local_context();

my $schema = MatchGame::DB::Schema->instance;

sub db {
    my $c = shift;
    if (!exists $c->{db}) {
        my $conf = $c->config->{DBI}
            or die "Missing configuration about DBI";
        $c->{db} = MatchGame::DB->new(
            schema       => $schema,
            connect_info => [@$conf]
        );
    }
    $c->{db};
}

1;
__END__

=head1 NAME

MatchGame - MatchGame

=head1 DESCRIPTION

This is a main context class for MatchGame

=head1 AUTHOR

Alex Mazur
