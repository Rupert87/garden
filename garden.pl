use v5.14.2;
use Time::Piece qw(localtime);
#use Device::BCM2835;
#use Win32;
#use Win32::Daemon;
use warnings;
my $debug = 1;

my $user_input = menu();
dispatcher($user_input);

#Device::BCM2835::init()
# || die "Could not init library";

#my $Context = "{last_state} = SERVICE_RUNNING;"

#pretending this is the water controller by blinking an led on the pi
#Device::BCM2835::gpio_fsel(&Device::BCM2835::RPI_GPIO_P1_11,
#                           &Device::BCM2835::BCM2835_GPIO_FSEL_OUTP);

#$Context->{last_state} = SERVICE_RUNNING;
#Win32::Daemon::StartService();
#Win32::Daemon::State( SERVICE_RUNNING );

my $t = localtime;

#below is a test this wy for the while statement. 
#my $p = $t->hour >= 10 && $t->min <= 02;

say $t;

# time wasn't specfic just testing as i was doing it, Eventually want to add weather plugin and moister sensor. 
while ($t->hour >= 15 && $t->min <= 16)
{
say $t;

# Turn it on
#    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_11, 1);
#   Device::BCM2835::delay(500); # Milliseconds
    # Turn it off
#    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_11, 0);
#   Device::BCM2835::delay(500); # Milliseconds

}

sub menu{

say 'Would you likek to turn water off';

say 'Turn (O)n';

say 'Turn O(F)f';

print 'Choice: ';
	my $user_input = <STDIN>;
	chomp($user_input);
	return $user_input;
    
}

sub dispatcher{
	my $what_to_do = shift;
	
	given(lc($what_to_do)){
		when ('O') {
			turn_on();
		}
		when ('F'){
			turn_off();
		}
		when ('q'){
			exit;
		}
		default {
			say "You didn't pick something I understand, try again. (Press enter to continue)";
			<STDIN>; #pausing for the user to press enter
			menu();
		}
	}
	
}

sub turn_on{
say 'Turning On!'

}

sub turn_off {
say 'Turning Off!'

}
menu();
