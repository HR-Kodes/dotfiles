#!/bin/sh

# Get the current date in the format YYYY-MM-DD
today=$(date +%Y-%m-%d)

# Extract the day from the date string
day="${today: -2}"

# Determine the superscript based on the day and special cases
case $day in
# ᵗʰ ˢᵗ ⁿᵈ  ʳᵈ
1) [[ $today =~ 1[1-3]$ ]] && superscript="ᵗʰ" || superscript="ˢᵗ" ;;
2) [[ $today =~ 1[2-3]$ ]] && superscript="ᵗʰ" || superscript="ⁿᵈ" ;;
3) [[ $today =~ 13$ ]] && superscript="ᵗʰ" || superscript="ʳᵈ" ;;
*) superscript="ᵗʰ" ;;
esac

# Print the day with the superscript
echo "$superscript"
