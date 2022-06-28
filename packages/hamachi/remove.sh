#!/bin/bash

sudo apt autoremove hamachi

sed "/alias hamachi-restart='sudo hamachi logoff; sleep 1; sudo hamachi login;'/d" "$HOME/.bashrc" > tmp.txt && mv tmp.txt "$HOME/.bashrc"
