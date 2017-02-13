package MatchGame::Web::Dispatcher;
use strict;
use warnings;

use Amon2::Web::Dispatcher::Lite;
use MatchGame::Web::ImageLoader;

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

any '/game' => sub {
    my ($c) = @_;

	my $img_list = getImageList()
    if (my $body = $c->req->param('body')) {
        $c->db->insert(
            game => +{
            	type => 'username',
                data => $body,
            }
        );
    }
    return $c->redirect('/');
    return $c->render( "game.tx" => { game => \@entries, } );
};


1;