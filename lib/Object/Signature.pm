package Object::Signature;

use strict;
use prefork 'Storable';
use prefork 'Digest::MD5';

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.01';
}

# The main (only) method.
# The prototype only applies when called as a function.
sub signature {
	require Storable;
	require Digest::MD5;
	local $Storable::canonical = 1;
	Digest::MD5::md5_hex(
		Storable::nfreeze(shift)
		);
}

1;

=pod

=head1 NAME

Signature - Generate cryptographic signatures for objects

=head1 SYNOPSIS

  # In your module
  package My::Module
  use base 'Object::Signature';
  
  # In outside code
  my $Object = My::Module->new;  
  print "Object Signature: " . $Object->signature;

=head1 DESCRIPTION

Object::Signature is an abstract base class that you can inherit from in
order to allow your objects to generate unique cryptographic signatures.

The method used to generate the signature is based on Storable and
Digest::MD5. The object is fed to Storable::nfreeze to get a string,
which is then passed to Digest::MD5::md5_hex to get a unique 32
character hexidecimal signature.

=head1 METHODS

=head2 signature

The C<signature> method is the only method added to your class, and will
generate a unique 32 hexidecimal signature for any object it is called on.

=head1 TO DO

Allow Object::Signature to interact correctly with classes that are
already Storable subclasses, supporting their own Storable hooks.

=head1 SUPPORT

All bugs should be filed via the bug tracker at

L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Object%3A%3ASignature>

For other issues, contact the author

=head1 AUTHORS

Adam Kennedy (Maintainer), L<http://ali.as/>, cpan@ali.as

=head1 COPYRIGHT

Copyright (c) 2004 Adam Kennedy. All rights reserved.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut
