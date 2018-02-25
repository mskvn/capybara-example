IMAGE_NAME = 'mskvn/capybara-example'

namespace :docker do
  task :image => ['build', 'tag', 'push'] do
    puts 'Build, tag and push docker image with tests'
  end
  desc 'Build docker image with needed gems and tests'
  task :build do
    check_version
    sh "docker build -t #{IMAGE_NAME}:#{ENV['VERSION']} -f dockerfiles/Dockerfile ."
  end
  desc 'Tag image with VERSION and laster tags'
  task :tag do
    check_version
    sh "docker tag #{IMAGE_NAME}:#{ENV['VERSION']} #{IMAGE_NAME}:latest"
  end
  desc 'Push image to remote docker hub. WARNING: you should be login in docker hub and have access to repository'
  task :push do
    check_version
    sh "docker push #{IMAGE_NAME}:#{ENV['VERSION']}"
    sh "docker push #{IMAGE_NAME}:latest"
  end
end

def check_version
  raise "VERSION environment variable should be specified!" if ENV['VERSION'].to_s.empty?
end
