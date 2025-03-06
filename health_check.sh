#!/bin/bash
# system_health_check.sh - Automated diagnostic tool for in-vehicle OS testing

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

LOG_DIR="log/system_diagnostic"

if [ ! -d "$LOG_DIR" ]; then
	mkdir -p "$LOG_DIR"
fi

LOG_FILE="$LOG_DIR/$(date +%Y%m%d_%H%M)_health_check.txt"

check_service () {
	if systemctl is-active --quiet "$1"; then
		return 0
	else
		return 1
	fi
}

SERVICES=("ssh" "cron")

echo -e "============= SYSTEM DIAGNOSTIC started: $(date) ===========\n" | tee -a $LOG_FILE
for SERVICE in "${SERVICES[@]}"; do
	echo -e "Starting service: $SERVICE - " | tee -a $LOG_FILE
	if check_service $SERVICE == 0; then
		echo -e $GREEN"PASSED\n"$NC | tee -a $LOG_FILE
	else
		echo -e $RED"FAILED\n"$NC | tee -a $LOG_FILE
	fi
done

echo -e "\n============== SYSTEM DIAGNOSTIC ended: $(date) ============\n" | tee -a $LOG_FILE
