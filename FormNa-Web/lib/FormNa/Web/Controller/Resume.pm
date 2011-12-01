package FormNa::Web::Controller::Resume;
use Moose;
use namespace::autoclean;
use OpenDocument::Template;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

FormNa::Web::Controller::Resume - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $name            = $c->req->param('name');
    my $name_en         = $c->req->param('name_en');
    my $choise          = $c->req->param('name_choice');
    my $security_num    = $c->req->param('name');
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

}


=head1 AUTHOR

maxBong

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
