IMAGE_NAME = "ubuntu/focal64"
N = 0

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 2
    end
      
    config.vm.define "jenkins_slave" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "jenkins.slave"
                   
    
    config.vm.provision "shell", inline: <<-SHELL
    sudo systemctl stop ufw
    sudo apt-get update
    sudo apt-get install openjdk-11-jdk -y
    sudo apt-get install docker.io -y
    sudo systemctl start docker
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwT6FHK2dQVQZiOClbiiDwodz5niQtiFNVfdDcMAC7ZpQTEJeV4ztKpxbP7PKcew3KvQpz/Tj+g8eD0ukI5ppv1Itw+vdS/fpijt7vJ6Y/BpleOOfUzwa/Rm5WlMhluv8AV0Xp0ltBbbtBIgM0A6QwdcpYGetkQIO1sw4M72mzPEICvYbjXiATPzph8dL1JSXfRIX4rWaMLonAUPx16ehwJxRQOh4FN44Zxc+KDyC9FuV6l4JEi+isdG9oMqz2dsM1JRv88gQm7pdItY6UKUWdKp9DTN+oLzcNAtIS0Ln7R4dyNeJeQ7EgfWecv+c8HjghflFwHplPa+DEi4jmIwNEO5a/ue1XfnxEX2ex8W3TnV0lITP9GGoB0Ktxk7dWojOkAU6B/clka8dTm6HZDf13EtzAggQyFnrGyNPPVI58daXbx82gSSpjTRIVBe+VJ8btBB89YAQfV2c27kGQPT5c5Dj8GsWE+IyW3MZ6A8jv9R4L73Inn/0Khf23t6HaWVmN7tWjukzsPeOP0d7FjqURM7tiEFFghX6hV24/aBQv1jMh8x7EJ20V5q5xypZJGLeSto7+f3L7qeC/WtZktnaaxot2DM4sq3msNgG1aCmvBs6RZii6u2PS5iHC5MCFsZ+1eZ3lzluSgcL9h6Kc57gpugXEC+LryMXzOVzPSUroLw== reaaavaaahhh@gmail.com" >> /home/vagrant/.ssh/authorized_keys
  SHELL
  end


    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            node.vm.hostname = "node-#{i}"

                
            end
        end
    end

