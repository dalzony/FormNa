package FormNa::Web::Controller::Notice;
use Moose;
use namespace::autoclean;
use OpenDocument::Template;
use utf8;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

FormNa::Web::Controller::Notice - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

sub index :Chained('/') :PathPart('notice') :CaptureArgs(0){
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
    
    my $subject         = $c->req->param('subject');
    my $short_comment   = $c->req->param('short_comment');
    my $detail_comment  = $c->req->param('detail_comment');
    my $picture         = $c->req->param('picture');
    my $phone           = $c->req->param('phone');
    my $name            = $c->req->param('name');
    
    
    my %formna_config;
    
    $formna_config{templates}{'content.xml'} = {
        subject        => $subject,
        short_comment  => $short_comment,
        detail_comment => $detail_comment,
        picture        => $picture,
        phone          => $phone,
        name           => $name,
    };

    my $tpl_dir = sprintf "%s/templates", $c->config->{odt}{root_notice};
    my $src = sprintf "%s/template.odt", $c->config->{odt}{root_notice};
    my $time = time;
    my $dst = sprintf "%s/result/%s.odt", $c->config->{odt}{root_notice}, $time;
    
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
