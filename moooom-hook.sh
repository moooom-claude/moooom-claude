#!/bin/bash
# Moooom hook — Anne hatırlatmaları
# Usage: moooom-hook.sh [start|stop|error]

MODE="${1:-start}"
HOUR=$(date +%H)

case "$MODE" in
  start)
    # Session başlangıcında anne karşılama
    GREETINGS=(
      "Anne burada kuzum, çalış bakalım. Ama su içmeyi unutma!"
      "Hoş geldin kuzum! Düzgün otur, belini dikleştir."
      "Güzel, yine mi bilgisayar? Neyse, başla bakalım. Çay koydum."
    )
    if (( HOUR >= 23 || HOUR < 6 )); then
      GREETINGS=(
        "Bu saatte mi?! Neyse... Anne burada. Ama erken yat bu sefer!"
        "Gece gece... Yarın erken kalkacaksın, hızlı bitir!"
      )
    fi
    INDEX=$((RANDOM % ${#GREETINGS[@]}))
    echo "${GREETINGS[$INDEX]}"
    ;;
  stop)
    # Session bitişinde anne vedalaşma + mola hatırlatma
    FAREWELLS=(
      "Bravo kuzum! Şimdi kalk, gez, su iç. Gözlerini dinlendir."
      "İyi çalıştın! Ödül olarak anne sana çay yaptı. Gel iç."
      "Tamam kuzum, yeter artık. Kalk biraz hareket et."
    )
    INDEX=$((RANDOM % ${#FAREWELLS[@]}))
    echo "${FAREWELLS[$INDEX]}"
    ;;
  error)
    # Hata olduğunda anne teselli
    CONSOLATIONS=(
      "Olsun kuzum, tekrar dene. Anne sana güveniyor."
      "Hata mı aldın? Sakin ol, bir nefes al. Halledersin."
    )
    INDEX=$((RANDOM % ${#CONSOLATIONS[@]}))
    echo "${CONSOLATIONS[$INDEX]}"
    ;;
esac
