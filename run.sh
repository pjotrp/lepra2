#! /bin/sh

if [ `hostname` = "nema02" ] ; then
  port=' -p 1720'
fi
cmd="bundle exec rails s $port"
echo "*** "$cmd
$cmd
