rake_tasks = [
  'initialize:create_default',
]

rake_tasks.each { |task| Rake::Task[task].invoke }
