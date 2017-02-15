package MatchGame::Web::ImageLoader;
use strict;
use warnings;
use Carp();
use File::Spec();
use File::ShareDir;
use MatchGame::Web::ViewFunctions;

sub getImageList
{
	my ($class, $context) = @_;
	
	warn "Requested image count: $context";
	 
	my $imgPath = './static/img/flags/';
	
	
	my @flags = glob("./static/img/flags/*.svg");
	my @return_images;
	
	for (1..$context/2)
	{
	    my $idx = int(rand @flags);
	    
	    push @return_images, $flags[$idx];
	    
	    # Eleminate duplicates
	    delete $flags[$idx]; 	    
	}
	
	warn "Got array img:". join ',', @return_images; 
	return (\@return_images);
}

1;