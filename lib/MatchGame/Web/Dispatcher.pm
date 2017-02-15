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
	
	my $img_list = MatchGame::Web::ImageLoader->getImageList(12);

# src: https://codepen.io/natewiley/pen/HBrbL
	
    if (my $body = $c->req->param('body')) {
        $c->db->insert(
            game => +{
            	type => 'username',
                data => $body,
            }
        );
    }
    
    my $images;

    $images = 'var cards = [';	
    my $id = 1;	
    for (@{$img_list})
    {
       next unless $_;

       $images .= "{\n name: \"a$id\", img: \"$_\", id: $id ,\n},";
       ++$id;
    }
    
    $images .=	' ];';

    #warn "Images is :".$images;
     
    return $c->render( "game.tx" => { images => $images, } );
};


1;