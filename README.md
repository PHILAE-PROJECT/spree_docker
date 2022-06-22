# spree_docker
Starter Spree with Lograge enabled

#For Linux based systems

Run the bin/setup file and do "docker-compose up"

WARNING: Make sure you have execution rights on the setup files. If not, do a chmod command in order to grant the rights: chmod +x.

Add sample data: docker-compose run --rm web bash -c "bundle exec rake spree_sample:load" before compose up

# FOR WINDOWS

Delete the coresponding files + copy rename : rm -rf .env && cp -f .env.sample .env

docker-compose pull

docker-compose build web

docker-compose run --rm web bash -c "bin/wait-for-services && (bundle check || bundle install) && bundle exec rails db:drop && bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed && bundle exec rake spree_sample:load && rm -rf tmp/latest.dump"

docker-compose up
