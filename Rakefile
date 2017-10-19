task default: :cucumber

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new do |task|
    tag_opt = ""
    dry_opt = ""
    format_opt = ""

    fail "ENV VLAN_ID is empty or invalid" if ENV.fetch('VLAN_ID', '').to_i == 0

    sites_env = ENV.fetch('SITES', '')
    dry_opt = "--dry-run" if sites_env.scan(/DRY/).size > 0
    sites = sites_env.gsub(/DRY/, "").split(' ')

    if ENV.fetch('SITES', '').scan(/ALL/).size > 0 then
      tag_opt = "--tags @multi-site"
    else
      sites.combination(sites.length-1) do |selected_sites|
        tag_opt += "--tags #{selected_sites.join(',')} "
      end
      # p tag_opt
    end
    dry_opt = "--dry-run" if ENV.fetch('DRY', '0').to_i != 0
    if ENV.fetch('CUCUMBER_FORMAT', '') != ""
      format_opt = "--format " + ENV.fetch('CUCUMBER_FORMAT')
    end
    task.cucumber_opts = "--tags '~@wip' #{tag_opt} #{dry_opt} #{format_opt}"
  end
rescue LoadError
  task :cucumber do
    $stderr.puts 'Cucumber is disabled'
  end
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  task :rubocop do
    $stderr.puts 'RuboCop is disabled'
  end
end
