vagrant up

vagrant ssh -c "ip a show eth1" | grep "inet " | awk '{print $2}' | sed 's/\/24//g'

docker build -t=ansible .

docker run -it -v ~/.vagrant.d/:/vagrant/ ansible ansible vagrant -m ping -u vagrant -vvvv --private-key=/vagrant/insecure_private_key

