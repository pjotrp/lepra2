cd ../..
rake db:drop ; rake db:create ; rake db:migrate 
cd db/old
ruby old_migrations.rb
rake db_seed
