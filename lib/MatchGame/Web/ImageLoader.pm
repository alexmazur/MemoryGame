package MatchGame::Web::ImageLoader;
use strict;
use warnings;
use Carp();
use File::Spec();
use File::ShareDir;
use MatchGame::Web::ViewFunctions;

our $VERSION = '0.02';

sub new {
    my $class = shift;
    my %opts  = @_;
    
    my $self = {
    	%opts
    };
    
    bless $self, $class;
    return $self;
}

sub getImageList
{
	my ($self, $context) = @_;
	 
	my $imgPath = './static/img/flags/';
	
	
	my @flags = glob("./static/img/flags/*.svg");
	my @return_images;
	
	for (1..$context/2)
	{
	    my $idx = int(rand @flags);
	    
	    push @return_images, $flags[$idx];
	    
	    # Eleminate duplicates
	    splice (@flags, $idx, 1);
	    #delete $flags[$idx]; 	    
	}
	
	warn "Got array img:". join ',', @return_images; 
	return (\@return_images);
}

1;