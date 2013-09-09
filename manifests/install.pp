# This class is used by the ruby or pe_ruby class
class r10k::install (
  $version,
  $pe_ruby,
) {

  if $pe_ruby {
    $provider = 'pe_gem'
  } else {
    $provider = 'gem'
    # rubygems_update => false
    # https://projects.puppetlabs.com/issues/19741
    class { '::ruby':
      rubygems_update => false,
      before          => Package['r10k'],
    }
  }

  package { 'r10k':
    ensure   => $version,
    provider => $provider,
  }

}
