# encoding: utf-8

##
# Backup Generated: backupDB
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t backupDB [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
Model.new(:backupDB, 'Description for backupDB') do
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  archive :my_archive do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.add "/path/to/a/file.rb"
    archive.add "/path/to/a/folder/"
    archive.exclude "/path/to/a/excluded_file.rb"
    archive.exclude "/path/to/a/excluded_folder"
  end

  ##
  # MySQL [Database]
  #
  database MySQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = "ficha2_dev"
    db.username           = "root"
    db.password           = "admin"
    db.host               = "localhost"
    db.port               = 3306
    #db.socket             = "/tmp/mysql.sock"
    # Note: when using `skip_tables` with the `db.name = :all` option,
    # table names should be prefixed with a database name.
    # e.g. ["db_name.table_to_skip", ...]

  end

  ##
  # Dropbox [Storage]
  #
  # Your initial backup must be performed manually to authorize
  # this machine with your Dropbox account. This authorized session
  # will be stored in `cache_path` and used for subsequent backups.
  #
  store_with Dropbox do |db|
    db.api_key     = "wgtsdfn3dmdsz9m"
    db.api_secret  = "pb1bsy48xj5ymkh"
    # Sets the path where the cached authorized session will be stored.
    # Relative paths will be relative to ~/Backup, unless the --root-path
    # is set on the command line or within your configuration file.
    db.cache_path  = ".cache"
    # :app_folder (default) or :dropbox
    db.access_type = :app_folder
    db.path        = "/BackupFicha2"
    db.keep        = 25
    # db.keep        = Time.now - 2592000 # Remove all backups older than 1 month.
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = "ficha2.mat@gmail.com"
    mail.to                   = "ficha2.mat@gmail.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = 587
    mail.domain               = "your.host.name"
    mail.user_name            = "ficha2.mat@gmail.com"
    mail.password             = "passwdubuntu"
    mail.authentication       = "plain"
    mail.encryption           = :starttls
  end

end