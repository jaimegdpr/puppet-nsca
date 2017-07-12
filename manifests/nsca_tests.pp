class nsca::nsca_tests {
    
    require ciemat_tweaks::folders

    $tests_list = ['cvmfs-fsck.sh',
                   'check_dev_null.sh',
                   'check_dev_null_statusok.sh',
                   'send_nsca',
                   'rmhome.sh',
                   'nsca.py',
                   'fake_checkfs.sh',
                   'checkfs.sh',
                   'killprocess.sh',
                   'disk_usage_control_statusok.sh',
                   'disk_usage.pl',
                   'info_homespace.sh',
                   'fake_killprocess.sh']

    $tests_list.each |String $test_file| {

        file { "/root/nsca/${test_file}":
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => "puppet:///grid_files/nsca/${test_file}",
        }

    }

    file { "/root/nsca/send_nsca.cfg":
        ensure => present,
        mode => '0600',
        owner => 'root',
        group => 'root',
        source => "puppet:///grid_files/nsca/send_nsca.cfg",
    }
    file { "/root/nsca/pattern.file":
        ensure => present,
        mode => '0600',
        owner => 'root',
        group => 'root',
        source => "puppet:///grid_files/nsca/pattern.file",
    }
    
}
