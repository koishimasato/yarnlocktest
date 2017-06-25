namespace :bundle do
  desc "bundle update & github pullreq"
  task run_bundle: :setup do
    Rake::Task["tachikoma:run_bundler"].invoke
    # TaskNotificationJob.perform_later('bundle')
  end

  desc "yarn upgrade & github pullreq"
  task run_yarn: :setup do
    Rake::Task["tachikoma:run_yarn"].invoke
    # TaskNotificationJob.perform_later('yarn')
  end

  task setup: :environment do
    require 'bundler/setup'
    require 'tachikoma/tasks'
    ENV['BUILD_FOR'] = 'yarnlocktest'
    # TODO
    ENV['TOKEN_YARNLOCKTEST'] = 'TODO'
  end
end
