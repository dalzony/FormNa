package FormNa::Web::Controller::Resume;
use Moose;
use namespace::autoclean;
use OpenDocument::Template;
use utf8;

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
    my $choise          = $c->req->param('choice');
    my $security_num    = $c->req->param('security_num');
choice
security_num
email
phone
cell_p
address
army
veteran
exemption
term_a
section
service
rank
etc_a
term_s_1
term_s_2
name_s_1
name_s_2
major_1
major_2
score_s_1
score_s_2
term_c_1
term_c_2
term_c_3
term_c_4
name_c_1
name_c_2
name_c_3
name_c_4
part_c_1
part_c_2
part_c_3
part_c_4
position_1
position_2
position_3
position_4
en_ex
en_good
en_well
en_poor
toeic
j_ex
j_good
j_well
j_poor
jlpt
etc_lang
com_ex
com_good
com_well
com_poor
pro_ex
pro_good
pro_well
pro_poor
etc_com
etc_ability
date_1
date_2
date_3
date_4
licence_1
licence_2
licence_3
licence_4
organ_1
organ_2
organ_3
organ_4
term_v_1
term_v_2
term_v_3
organ_v_1
organ_v_2
organ_v_3
activity_1
activity_2
activity_3
year
month
day
    my %formna_config;
    
    $formna_config{templates}{'content.xml'} = {
        name          => $name,
        name_en       => $name_en,
        choice        => $choise,
        security_num  => $security_num,
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
