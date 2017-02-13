package MatchGame::Web::ImageLoader;
use strict;
use warnings;
use Carp();
use File::Spec();

use File::ShareDir;

sub getImageList 
{
	my ($class, $context) = @_;
	
	my $img_path = File::Spec->catdir($context->base_dir(), 'static/img/flags');
	 
	my $imgPath = './static/img/flags/';
	
	chdir $imgPath or Carp::croak("Can't chdir: $!");
	
	my @flags = glob("*.svg");
	my @return_images;
	
	for (0..$total)
	{
	    my $idx = int(rand @flags) +1;
	    
	    push @return_images, $flags[$idx];
	    
	    # Eleminate duplicates
	    delete $flags[$idx]; 	    
	}
	
	return (\@return_images);
}

1;