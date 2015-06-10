#How test

##1 Create file simple.rb
```ruby
  sleep 5
``` 

##2 Start process
```ruby
pids_manager = PidsManager.new
pid = pids_manager.start("ruby /path/to/simple.rb")
puts pid
``` 
##3 Is running process
```ruby
pids_manager.alive?(pid)
``` 
##4 Kill process
```ruby
pids_manager.stop(pid)
```
##5 Is not running process 
```ruby
pids_manager.alive?(pid)
```