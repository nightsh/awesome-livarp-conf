#! /bin/bash
echo "Mise a jour de votre Système :"
sudo aptitude update
sudo aptitude upgrade
sudo aptitude autoremove
sudo aptitude clean
