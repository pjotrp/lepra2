cd ../..
rake db:drop ; rake db:create ; rake db:migrate 
ruby db/old/old_migrations.rb
rake db_seed
