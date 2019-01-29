#!/bin/bash
svc -t -x ~/.conduite
rm -rf ~/.conduite/supervise
sleep 3 && sudo shutdown now
