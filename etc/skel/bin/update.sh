#! /bin/bash
echo "Mise a jour de votre Système :"
sudo aptitude update
sudo aptitude upgrade
sudo apt-get autoremove
sudo apt-get clean
