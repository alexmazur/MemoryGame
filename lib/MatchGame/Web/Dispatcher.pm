package MatchGame::Web::Dispatcher;
use strict;
use warnings;

use Amon2::Web::Dispatcher::Lite;

any '/' => sub {
    my ($c) = @_;

    my @entries = $c->db->search(
        game => {
        }, {
            order_by => 'id DESC',
            limit    => 10,
        }
    );
    return $c->render( "index.tx" => { game => \@entries, } );
};  

post '/post' => sub {
    my ($c) = @_;

    if (my $body = $c->req->param('body')) {
        $c->db->insert(
            game => +{
            	type => 'username',
                data => $body,
            }
        );
    }
    return $c->redirect('/');
};

1;