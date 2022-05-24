
echo -e "\e[32mStarting application...\033[0m"

# Start MariaDB and Redis

# if pidof -x "mysqld" -o $$ > /dev/null; then
# echo "MariaDB already running. No need to run again."
# else
# mysqld --defaults-file=/home/runner/$REPL_SLUG/system/config/my.cnf --datadir="/home/runner/$REPL_SLUG/system/mariadb" --silent-startup &
# fi

# Since Redis is a cache DB, keep this running after repl stop and only after full repl reboot, so if app crashes for whatever reason contents in Redis is not lost.
# if pidof -x "redis-server" -o $$ > /dev/null; then
# echo "Redis already running. No need to run again."
# else
# redis-server /home/runner/$REPL_SLUG/system/config/redis.conf --daemonize yes
# fi

echo -e "Generating a .env file"

echo "
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:TCZp+HP+Al34mwiracXU9Y0DALdxy5kL9I7RUdILAIc=
APP_DEBUG=true
APP_URL=https://Laravel-On-Replit.mohammedalrowad.repl.co
ON_REPLIT=true

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=sqlite
DB_DATABASE=/home/runner/$REPL_SLUG/db.db
DB_FOREIGN_KEYS=true

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DRIVER=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=null
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1

MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
" > src/.env


# Serve application
cd src
echo -e "\e[32mLaravel app live 🚀!\033[0m"
php artisan serve -q --host=0.0.0.0