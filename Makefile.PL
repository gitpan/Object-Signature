#!/usr/bin/perl

use inc::Module::Install;

name           ('Object-Signature'           );
abstract       ('Abstract base class for creating object signatures');
author         ('Adam Kennedy<cpan@ali.as>'  );
version_from   ('lib/Object/Signature.pm'    );
license        ('perl'                       );

requires       ('perl'            => '5.005' );
requires       ('prefork'         => '0.02'  );
requires       ('Storable'        => '2.11'  );
requires       ('Digest::MD5'     => '2.00'  );

build_requires ('Test::More'      => '0.47'  );
build_requires ('File::Spec'      => '0.82'  );

auto_install();

&WriteAll;
