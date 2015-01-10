export DISPLAY=:99
Xvfb :99 -shmem -screen 0 1366x768x16 &
x11vnc -passwd secret -display :99 -N -forever &
# selenium must be started by a non-root user otherwise chrome can't start
su - seleuser -c "selenium-standalone start"
