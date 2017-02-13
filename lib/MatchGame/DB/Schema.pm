package MatchGame::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'MatchGame::DB::Row';

table {
    name 'sessions';
    pk 'id';
    columns qw(session_data);
};

table {
    name 'game';
    pk 'id';
    columns qw(id type data);
};


1;