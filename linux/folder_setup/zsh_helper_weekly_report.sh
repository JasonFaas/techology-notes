function weekly-report-jfaas {
  # Calculate last Tuesday at noon PT
  # date +%u: 1=Mon, 2=Tue, 3=Wed, 4=Thu, 5=Fri, 6=Sat, 7=Sun
  today=$(date +%u)
  current_hour=$(date +%H)

  if [[ $today -eq 2 ]]; then
    # Today is Tuesday
    if [[ $current_hour -lt 12 ]]; then
      # Before noon, go back to last Tuesday (8 days ago)
      last_tuesday=$(date -v-8d +%Y-%m-%dT12:00:00)
    else
      # At or after noon, use this Tuesday
      last_tuesday=$(date +%Y-%m-%dT12:00:00)
    fi
  else
    # Calculate days back to last Tuesday
    if [[ $today -gt 2 ]]; then
      days_back=$((today - 2))
    else
      days_back=$((today + 5))
    fi
    last_tuesday=$(date -v-${days_back}d +%Y-%m-%dT12:00:00)
  fi

  echo "📊 Weekly report for commits by jfaas since $last_tuesday"
  echo ""
  echo "=== DEVOPS ==="
  git -C /Users/jaf/Code/1/devops log master --no-merges --after="$last_tuesday" --author="jfaas" --format="%ad %s" --date=short

  echo ""
  echo "=== OTTER-SANDBOX ==="
  git -C /Users/jaf/Code/1/otter-sandbox log HEAD --no-merges --after="$last_tuesday" --author="jfaas" --format="%ad %s" --date=short
}
