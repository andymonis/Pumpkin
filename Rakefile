require 'rake/clean'

CLEAN.include( FileList[ 'stage3/00-install-packages/files/*.deb'])

desc "grab hubaccess .deb file"
task :default do
   Rake::Task["clean"].invoke
   `aws  s3 sync --exact-timestamps   --exclude "*" --include "*.deb" s3://pumpco/ stage3/00-install-packages/files/`
   files = `md5sum stage3/00-install-packages/files/*`
   puts files
end

# reminder on how to get the travis stuff for encrypting, for build automation
file "travis" do
    `gem install travis`
end

# build automation to insert creds into .travis.yml. Can use --add flag, but that mangles
# .travis.yml
task "encrypt_aws_creds" do
    akid = `travis encrypt AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id)" `
    ask  = `travis encrypt AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key)"`
    puts akid, ask
end

# AMONIS: Not used 18/10/2019
task "build_base_docker_image" do
    puts "building iotaa-pi-gen"
    `docker build -t timcoote/iotaa-pi-gen -f Dockerfile .`
    `docker push timcoote/iotaa-pi-gen`
end

# Design Time Task
# Generate Travis secrets for AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY
# This generates two secure entries that can be used in the .travis.yml file. 
# echoed to the screen or --add will auto add if in the project
# Requires python / rake and travis to be installed
# Passwords in PWSafe
# AMONIS: 21/10/2019
task "create_aws_credetials" do
    akid = `travis encrypt AWS_ACCESS_KEY_ID="<PWSafe aws/Jenkins_Aws/username>" `
    ask  = `travis encrypt AWS_SECRET_ACCESS_KEY="<PWSafe aws/Jenkins_Aws/password>"`
    puts akid, ask
end