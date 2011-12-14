God.watch do |w|
  w.name  = "rock_paper_scissors"
  w.interval = 30.seconds
  w.start = "ruby rock_paper_scissors.rb"
  w.start_grace = 10.seconds
  w.restart_grace = 10.seconds
  w.dir = '/var/www/rock_paper_scissors'
  w.log = 'log'

  w.start_if do |start|
    start.condition(:process_running) do |c|
      c.running = false
    end
  end

  w.restart_if do |restart|
    restart.condition(:memory_usage) do |c|
      c.above = 300.megabytes
      c.times = 2
    end

    restart.condition(:cpu_usage) do |c|
      c.above = 90.percent
      c.times = 5
    end
  end

  w.lifecycle do |on|
    on.condition(:flapping) do |c|
      c.to_state = [:start, :restart]
      c.times = 5
      c.within = 5.minutes
      c.transition = :unmonitored
      c.retry_in = 10.minutes
      c.retry_times = 5
      c.retry_within = 30.minutes
    end
  end
end