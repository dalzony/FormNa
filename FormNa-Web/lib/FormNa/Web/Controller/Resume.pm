package FormNa::Web::Controller::Resume;
use Moose;
use namespace::autoclean;
use OpenDocument::Template;
use utf8;
use DateTime;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

FormNa::Web::Controller::Resume - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Chained('/') :PathPart('resume') :CaptureArgs(0){
    my ( $self, $c ) = @_;
}

=head2 form_index

Display form to web

=cut

sub form_index :Chained('index') :PathPart('') :Args(0) {
    my ($self, $c) = @_;
}

=head2 form_create_do

Take information from form and add to odt file

=cut

sub form_create_do :Chained('index') :PathPart('form_create_do') :Args(0) {
    my ($self, $c) = @_;
    
    my $name            = $c->req->param('name');
    my $name_en         = $c->req->param('name_en');
    my $image		= $c->req->param('image');	
    my $choice          = $c->req->param('choice');
    my $security_num    = $c->req->param('security_num');
    my $choice          = $c->req->param('choice');
    my $security_num    = $c->req->param('security_num');
    my $email           = $c->req->param('email');
    my $phone           = $c->req->param('phone');
    my $cell_p          = $c->req->param('cell_p');
    my $address         = $c->req->param('address');
    my $army            = $c->req->param('army');
    my $veteran         = $c->req->param('veteran');
    my $exemption       = $c->req->param('exemption');
    my $term_a          = $c->req->param('term_a');
    my $section         = $c->req->param('section');
    my $service         = $c->req->param('service');
    my $rank            = $c->req->param('rank');
    my $etc_a           = $c->req->param('etc_a');
    my $term_s_1        = $c->req->param('term_s_1');
    my $term_s_2        = $c->req->param('term_s_2');
    my $name_s_1        = $c->req->param('name_s_1');
    my $name_s_2        = $c->req->param('name_s_2');
    my $major_1         = $c->req->param('major_1');
    my $major_2         = $c->req->param('major_2');
    my $score_s_1       = $c->req->param('score_s_1');
    my $score_s_2       = $c->req->param('score_s_2');
    my $term_c_1        = $c->req->param('term_c_1');
    my $term_c_2        = $c->req->param('term_c_2');
    my $term_c_3        = $c->req->param('term_c_3');
    my $term_c_4        = $c->req->param('term_c_4');
    my $name_c_1        = $c->req->param('name_c_1');
    my $name_c_2        = $c->req->param('name_c_2');
    my $name_c_3        = $c->req->param('name_c_3');
    my $name_c_4        = $c->req->param('name_c_4');
    my $part_c_1        = $c->req->param('part_c_1');
    my $part_c_2        = $c->req->param('part_c_2');
    my $part_c_3        = $c->req->param('part_c_3');
    my $part_c_4        = $c->req->param('part_c_4');
    my $position_1      = $c->req->param('position_1');
    my $position_2      = $c->req->param('position_2');
    my $position_3      = $c->req->param('position_3');
    my $position_4      = $c->req->param('position_4');
    my $en_ex           = $c->req->param('en_ex');
    my $en_good         = $c->req->param('en_good');
    my $en_well         = $c->req->param('en_well');
    my $en_poor         = $c->req->param('en_poor');
    my $toeic           = $c->req->param('toeic');
    my $j_ex            = $c->req->param('j_ex');
    my $j_good          = $c->req->param('j_good');
    my $j_well          = $c->req->param('j_well');
    my $j_poor          = $c->req->param('j_poor');
    my $jlpt            = $c->req->param('jlpt');
    my $etc_lang        = $c->req->param('etc_lang');
    my $com_ex          = $c->req->param('com_ex');
    my $com_good        = $c->req->param('com_good');
    my $com_well        = $c->req->param('com_well');
    my $com_poor        = $c->req->param('com_poor');
    my $pro_ex          = $c->req->param('pro_ex');
    my $pro_good        = $c->req->param('pro_good');
    my $pro_well        = $c->req->param('pro_well');
    my $pro_poor        = $c->req->param('pro_poor');
    my $etc_com         = $c->req->param('etc_com');
    my $etc_ability     = $c->req->param('etc_ability');
    my $date_1          = $c->req->param('date_1');
    my $date_2          = $c->req->param('date_2');
    my $date_3          = $c->req->param('date_3');
    my $date_4          = $c->req->param('date_4');
    my $licence_1       = $c->req->param('licence_1');
    my $licence_2       = $c->req->param('licence_2');
    my $licence_3       = $c->req->param('licence_3');
    my $licence_4       = $c->req->param('licence_4');
    my $organ_1         = $c->req->param('organ_1');
    my $organ_2         = $c->req->param('organ_2');
    my $organ_3         = $c->req->param('organ_3');
    my $organ_4         = $c->req->param('organ_4');
    my $term_v_1        = $c->req->param('term_v_1');
    my $term_v_2        = $c->req->param('term_v_2');
    my $term_v_3        = $c->req->param('term_v_3');
    my $organ_v_1       = $c->req->param('organ_v_1');
    my $organ_v_2       = $c->req->param('organ_v_2');
    my $organ_v_3       = $c->req->param('organ_v_3');
    my $activity_1      = $c->req->param('activity_1');
    my $activity_2      = $c->req->param('activity_2');
    my $activity_3      = $c->req->param('activity_3');
    my $year            = DateTime->now->year;
    $c->log->debug($year);
    my $month           = DateTime->now->month; 
    my $day             = DateTime->now->day;
    
    my %formna_config;
    
    $formna_config{templates}{'content.xml'} = {
        name          => $name,
        name_en       => $name_en,
        image	      => $image,
        choice        => $choice,
        security_num  => $security_num,
        choice        => $choice,
        security_num  => $security_num,
        email         => $email,
        phone         => $phone,
        cell_p        => $cell_p,
        address       => $address,
        army          => $army,
        veteran       => $veteran,
        exemption     => $exemption,
        term_a        => $term_a,
        section       => $section,
        service       => $service,
        rank          => $rank,
        etc_a         => $etc_a,
        term_s_1      => $term_s_1,
        term_s_2      => $term_s_2,
        name_s_1      => $name_s_1,
        name_s_2      => $name_s_2,
        major_1       => $major_1,
        major_2       => $major_2,
        score_s_1     => $score_s_1,
        score_s_2     => $score_s_2,
        term_c_1      => $term_c_1,
        term_c_2      => $term_c_2,
        term_c_3      => $term_c_3,
        term_c_4      => $term_c_4,
        name_c_1      => $name_c_1,
        name_c_2      => $name_c_2,
        name_c_3      => $name_c_3,
        name_c_4      => $name_c_4,
        part_c_1      => $part_c_1,
        part_c_2      => $part_c_2,
        part_c_3      => $part_c_3,
        part_c_4      => $part_c_4,
        position_1    => $position_1,
        position_2    => $position_2,
        position_3    => $position_3,
        position_4    => $position_4,
        en_ex         => $en_ex,
        en_good       => $en_good,
        en_well       => $en_well,
        en_poor       => $en_poor,
        toeic         => $toeic,
        j_ex          => $j_ex,
        j_good        => $j_good,
        j_well        => $j_well,
        j_poor        => $j_poor,
        jlpt          => $jlpt,
        etc_lang      => $etc_lang,
        com_ex        => $com_ex,
        com_good      => $com_good,
        com_well      => $com_well,
        com_poor      => $com_poor,
        pro_ex        => $pro_ex,
        pro_good      => $pro_good,
        pro_well      => $pro_well,
        pro_poor      => $pro_poor,
        etc_com       => $etc_com,
        etc_ability   => $etc_ability,
        date_1        => $date_1,
        date_2        => $date_2,
        date_3        => $date_3,
        date_4        => $date_4,
        licence_1     => $licence_1,
        licence_2     => $licence_2,
        licence_3     => $licence_3,
        licence_4     => $licence_4,
        organ_1       => $organ_1,
        organ_2       => $organ_2,
        organ_3       => $organ_3,
        organ_4       => $organ_4,
        term_v_1      => $term_v_1,
        term_v_2      => $term_v_2,
        term_v_3      => $term_v_3,
        organ_v_1     => $organ_v_1,
        organ_v_2     => $organ_v_2,
        organ_v_3     => $organ_v_3,
        activity_1    => $activity_1,
        activity_2    => $activity_2,
        activity_3    => $activity_3,
        year          => $year,
        month         => $month,
        day           => $day,
    };

    my $tpl_dir = sprintf "%s/templates", $c->config->{odt}{root_resume};
    my $src = sprintf "%s/template.odt", $c->config->{odt}{root_resume};
    my $time = time;
    my $dst = sprintf "%s/result/%s.odt", $c->config->{odt}{root_resume}, $time;
    
    my $odt = OpenDocument::Template->new(
        config       => \%formna_config,
        template_dir => $tpl_dir,
    	  src          => $src,
    	  dest         => $dst,
    );
    $odt->generate;
    $c->log->debug("Generated $dst");

    $c->res->headers->content_type('application/msword');
    $c->res->headers->header("Content-Disposition" => 'attachment;filename="' . "$time.doc" . '";');
    my $fh = IO::File->new( $dst, 'r' );
    $c->res->body($fh);
    undef $fh;
}

=head1 AUTHOR

maxBong

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
