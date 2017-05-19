use v5.14.2;
use Time::Piece qw(localtime);
use Device::BCM2835;
#use Win32;
#use Win32::Daemon;
use warnings;
my $debug = 1;

Device::BCM2835::init()
 || die "Could not init library";

#my $Context = "{last_state} = SERVICE_RUNNING;"


Device::BCM2835::gpio_fsel(&Device::BCM2835::RPI_GPIO_P1_11,
                            &Device::BCM2835::BCM2835_GPIO_FSEL_OUTP);

#$Context->{last_state} = SERVICE_RUNNING;
#Win32::Daemon::StartService();
#Win32::Daemon::State( SERVICE_RUNNING );

my $t = localtime;
#my $p = $t->hour >= 10 && $t->min <= 02;

say $t;


while ($t->hour >= 15 && $t->min <= 16)
{
say $t;

# Turn it on
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_11, 1);
    Device::BCM2835::delay(500); # Milliseconds
    # Turn it off
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_11, 0);
    Device::BCM2835::delay(500); # Milliseconds

}

say "Done!";

#}#warn
#say $t;