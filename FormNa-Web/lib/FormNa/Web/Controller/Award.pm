package FormNa::Web::Controller::Award;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

FormNa::Web::Controller::Award - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

sub index :Chained('/') :PathPart('award') :CaptureArgs(0){
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
    
    my %formna_config;
    
    $formna_config{templates}{'content.xml'} = {
        name          => $name,
    };

    my $tpl_dir = sprintf "%s/templates", $c->config->{odt}{root_award};
    my $src = sprintf "%s/template.odt", $c->config->{odt}{root_award};
    my $time = time;
    my $dst = sprintf "%s/result/%s.odt", $c->config->{odt}{root_award}, $time;
    
    my $odt = OpenDocument::Template->new(
        config       => \%formna_config,
        template_dir => $tpl_dir,
    	  src          => $src,
    	  dest         => $dst,
    );
    $odt->generate;
    $c->log->debug("Generated $dst");

}

=head1 AUTHOR

maxBong

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
