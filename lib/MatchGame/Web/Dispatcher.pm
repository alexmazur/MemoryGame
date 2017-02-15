package MatchGame::Web::Dispatcher;
use strict;
use warnings;
use Data::Dumper;

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

post '/game' => sub {
    my ($c) = @_;
	
	my $nCards = $c->req->param('cards') || 8;
	my $pName  = $c->req->param('name') || 'unknown';
	
	
    if (my $body = $c->req->param('body')) {
        $c->db->insert(
            game => +{
            	type => 'username',
                data => $pName,
            }
        );
        
        $c->db->insert(
            game => +{
            	type => 'cards',
                data => $nCards,
            }
        );
    }
        
    my $img_list = MatchGame::Web::ImageLoader->getImageList($nCards);

	# 	src: https://codepen.io/natewiley/pen/HBrbL
    
    my $images;

    #var img_urls = ["static/img/flags/tl.svg", "static/img/flags/ab.svg", "img/kangaroo.png", "img/leopard.png", "img/panther.png", "img/penguin.png", "img/rabbit.png", "img/sheep.png", "img/swan.png", "img/wolf.png", "img/zebra.png", "img/duck.png", "img/deer.png", "img/dolphin.png", "img/kangaroo.png", "img/leopard.png", "img/panther.png", "img/penguin.png", "img/rabbit.png", "img/sheep.png", "img/swan.png", "img/wolf.png", "img/zebra.png", "img/duck.png"];
    $images = 'var img_urls = [';	
    my $id = 1;	
    for (@{$img_list},@{$img_list})
    {
       next unless $_;

       $images .= "\"$_\", ";
       ++$id;
    }
    
    $images .=	' ];';
    
    
    return $c->render( "game.tx" => { images => $images, name => $pName, cards_number => $nCards } );

};

1;