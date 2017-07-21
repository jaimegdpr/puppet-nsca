#class {'nsca':
#    stage => last,
#}


class nsca {

    class {'nsca::nsca_tests':
#        stage => last,
    }
    class {'nsca::cron_config':
        stage => last,
    }
#
#    include nsca::nsca_tests
#    include nsca::cron_config

}
