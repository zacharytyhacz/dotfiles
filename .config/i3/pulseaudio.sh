#!/bin/bash

systemctl --user restart pulseaudio.service

pulseaudio --start
