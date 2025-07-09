#!/bin/bash

service mysql start

exec apache2ctl -D FOREGROUND