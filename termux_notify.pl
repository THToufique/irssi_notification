use strict;
use Irssi;

Irssi::signal_add('message private', sub {
    my ($server, $msg, $nick, $address) = @_;
    system("termux-notification --title 'IRC: $nick' --content '$msg' --vibrate 500 &");
});

Irssi::signal_add('message public', sub {
    my ($server, $msg, $nick, $address, $target) = @_;
    my $nick_me = $server->{nick};
    if ($msg =~ /\Q$nick_me\E/i) {
        system("termux-notification --title '$nick on $target' --content '$msg' --vibrate 500 &");
    }
});
