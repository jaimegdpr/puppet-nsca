class nsca::cron_config {

    cron::job { 'nsca_cron':
            minute      => '*',
            hour        => '*',
            date        => '*',
            month       => '*',
            weekday     => '*',
            user        => 'root',
            command     => '/root/nsca/disk_usage.pl >> /var/log/disk_usage.log 2>&1',
            description => 'Check disk usage every minute',
            mode => '0600',
            environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
    }

    cron::job { 'nsca_cron_devnull':
            minute      => '*/5',
            hour        => '*',
            date        => '*',
            month       => '*',
            weekday     => '*',
            user        => 'root',
            command     => '/root/nsca/check_dev_null.sh 2>&1 >& /dev/null &',
            mode => '0600',
            environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
    }

    cron::job { 'cron_cvmfs_fsck':
            minute      => '20',
            hour        => '7',
            date        => '*',
            month       => '*',
            weekday     => '*',
            user        => 'root',
            command     => '/root/nsca/cvmfs-fsck.sh shared > /dev/null 2>&1',
            mode => '0600',
            environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
    }
    
}
