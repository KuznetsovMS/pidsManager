class PidsManager

  def start(script_cmd)
    pid = spawn(script_cmd)
    Process.detach(pid)
    pid
  end

  def alive?(pid)
    begin
      Process.kill(0, pid)
      puts "#{pid} is running"
      return true
    rescue Errno::EPERM
      puts "No permission to query #{pid}!"
      return false
    rescue Errno::ESRCH
      puts "#{pid} is NOT running."
      return false
    rescue
      puts "Unable to determine status for #{pid} : #{$!}"
      return false
    end
  end

  def stop(pid)
    return if !alive?(pid)
    Process.kill(9, pid)
    begin
      Process.wait(pid)
    rescue Errno::ECHILD
    end
  end
end