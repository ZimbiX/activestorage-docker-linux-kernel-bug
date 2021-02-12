# Active Storage + Docker + Linux bug demo

Works outside Docker:

```
➜ ./test.sh 
Database 'db/test.sqlite3' already exists
Run options: --backtrace --seed 46176

# Running:

..

Finished in 0.541043s, 3.6966 runs/s, 0.0000 assertions/s.
2 runs, 0 assertions, 0 failures, 0 errors, 0 skips
```

Fails within Docker:

```
➜ ./test-docker.sh
Building with native build. Learn about native build in Compose here: https://docs.docker.com/go/compose-native-build/
Building dev
[+] Building 0.2s (7/7) FINISHED                                                   
 => [internal] load build definition from Dockerfile                          0.1s
 => => transferring dockerfile: 37B                                           0.0s
 => [internal] load .dockerignore                                             0.1s
 => => transferring context: 2B                                               0.0s
 => [internal] load metadata for docker.io/library/ruby:2.7.2-slim@sha256:84  0.0s
 => [1/3] FROM docker.io/library/ruby:2.7.2-slim@sha256:84d1cc2a61a5c8ad7c6e  0.0s
 => CACHED [2/3] RUN apt-get update -qq && apt-get install -y build-essentia  0.0s
 => CACHED [3/3] RUN useradd --no-log-init --system --create-home --uid 1000  0.0s
 => exporting to image                                                        0.0s
 => => exporting layers                                                       0.0s
 => => writing image sha256:6ad7387cd7f02f01cefaa8f02951e0b72ef1d8ea8370ecde  0.0s
 => => naming to docker.io/library/app_dev                                    0.0s
Successfully built 6ad7387cd7f02f01cefaa8f02951e0b72ef1d8ea8370ecde06a1097a34b82f4f
Creating app_dev_run ... done
The Gemfile's dependencies are satisfied
Database 'db/test.sqlite3' already exists
Run options: --backtrace --seed 55334

# Running:

.E

Error:
UserTest#test_attaching_a_file_using_Rack::Test::UploadedFile_-_this_method_fails_in_Docker:
ActiveStorage::IntegrityError: ActiveStorage::IntegrityError
    /usr/local/bundle/gems/activestorage-6.1.2.1/lib/active_storage/service/disk_service.rb:159:in `ensure_integrity_of'
    /usr/local/bundle/gems/activestorage-6.1.2.1/lib/active_storage/service/disk_service.rb:22:in `block in upload'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/notifications.rb:203:in `block in instrument'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/notifications/instrumenter.rb:24:in `instrument'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/notifications.rb:203:in `instrument'
    /usr/local/bundle/gems/activestorage-6.1.2.1/lib/active_storage/service.rb:155:in `instrument'
    /usr/local/bundle/gems/activestorage-6.1.2.1/lib/active_storage/service/disk_service.rb:20:in `upload'
    /usr/local/bundle/gems/activestorage-6.1.2.1/app/models/active_storage/blob.rb:253:in `upload_without_unfurling'
    /usr/local/bundle/gems/activestorage-6.1.2.1/lib/active_storage/attached/changes/create_one.rb:26:in `upload'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/core_ext/object/try.rb:15:in `public_send'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/core_ext/object/try.rb:15:in `try'
    /usr/local/bundle/gems/activestorage-6.1.2.1/lib/active_storage/attached/model.rb:77:in `block in has_one_attached'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:427:in `instance_exec'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:427:in `block in make_lambda'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:260:in `block in conditional'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:516:in `block in invoke_after'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:516:in `each'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:516:in `invoke_after'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:107:in `run_callbacks'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/callbacks.rb:824:in `_run_commit_callbacks'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/transactions.rb:321:in `committed!'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/connection_adapters/abstract/transaction.rb:146:in `commit_records'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/connection_adapters/abstract/transaction.rb:295:in `block in commit_transaction'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:26:in `block (2 levels) in synchronize'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `handle_interrupt'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `block in synchronize'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `handle_interrupt'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `synchronize'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/connection_adapters/abstract/transaction.rb:285:in `commit_transaction'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/connection_adapters/abstract/transaction.rb:340:in `block in within_new_transaction'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:26:in `block (2 levels) in synchronize'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `handle_interrupt'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `block in synchronize'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `handle_interrupt'
    /usr/local/bundle/gems/activesupport-6.1.2.1/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `synchronize'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/connection_adapters/abstract/transaction.rb:308:in `within_new_transaction'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/connection_adapters/abstract/database_statements.rb:320:in `transaction'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/transactions.rb:350:in `with_transaction_returning_status'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/transactions.rb:298:in `save'
    /usr/local/bundle/gems/activerecord-6.1.2.1/lib/active_record/suppressor.rb:44:in `save'
    /work/test/models/user_test.rb:18:in `block in <class:UserTest>'


rails test test/models/user_test.rb:12



Finished in 0.302280s, 6.6164 runs/s, 0.0000 assertions/s.
2 runs, 0 assertions, 0 failures, 1 errors, 0 skips
ERROR: 1
```

[View diff against generated Rails app](https://github.com/ZimbiX/activestorage-docker-linux-kernel-bug/compare/7e2c8c7..master)
