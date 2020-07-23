cd $HOME/BuiltSource/cla-local-dev

mount_common=0

if [ "$1" = "common" ]; then
  mount_common=1
fi

built do:refresh && make build-integrated

sleep 5

LIB_DEV=$mount_common make restart-integrated

sleep 8

built db:seed --regression
make recreate-all

cd -
