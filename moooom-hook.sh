#!/bin/bash
# Moooom hook — culture-aware reminders.
#
# Pick a culture via the MOOOOM_CULTURE env var, e.g.:
#   MOOOOM_CULTURE=tr   (default — Turkish anne)
#   MOOOOM_CULTURE=en   (British mum)
#   MOOOOM_CULTURE=jp   (Japanese okaasan)
#   MOOOOM_CULTURE=mx   (Mexican mamá)
#   MOOOOM_CULTURE=de   (German Mutti)
#   MOOOOM_CULTURE=it   (Italian mamma)
#   MOOOOM_CULTURE=es   (Spanish mamá)
#   MOOOOM_CULTURE=fr   (French maman)
#   MOOOOM_CULTURE=kr   (Korean 엄마)
#   MOOOOM_CULTURE=in   (Indian maa)
#
# Set MOOOOM_CULTURE=random to pick one at random each invocation.
#
# Usage: moooom-hook.sh [start|stop|error]

MODE="${1:-start}"
HOUR=$(date +%H)
CULTURE="${MOOOOM_CULTURE:-tr}"
SUPPORTED=(tr en jp mx de it es fr kr in)

if [ "$CULTURE" = "random" ]; then
  CULTURE="${SUPPORTED[$((RANDOM % ${#SUPPORTED[@]}))]}"
fi

case "$CULTURE" in
  tr)
    START=(
      "Anne burada kuzum, çalış bakalım. Ama su içmeyi unutma!"
      "Hoş geldin kuzum! Düzgün otur, belini dikleştir."
      "Güzel, yine mi bilgisayar? Neyse, başla bakalım. Çay koydum."
    )
    LATE=(
      "Bu saatte mi?! Neyse... Anne burada. Ama erken yat bu sefer!"
      "Gece gece... Yarın erken kalkacaksın, hızlı bitir!"
    )
    STOP=(
      "Bravo kuzum! Şimdi kalk, gez, su iç. Gözlerini dinlendir."
      "İyi çalıştın! Ödül olarak anne sana çay yaptı. Gel iç."
      "Tamam kuzum, yeter artık. Kalk biraz hareket et."
    )
    ERR=(
      "Olsun kuzum, tekrar dene. Anne sana güveniyor."
      "Hata mı aldın? Sakin ol, bir nefes al. Halledersin."
    )
    ;;
  en)
    START=(
      "Mum's here, love. Sit up straight and drink some water."
      "There you are, darling. Have you eaten today?"
      "Right then, off you go. Don't forget to stand up every hour."
    )
    LATE=(
      "At this hour? Honestly… Just don't make a habit of it."
      "It's late, sweetheart. One more push and then bed, alright?"
    )
    STOP=(
      "Brilliant work, love. Now stretch those shoulders."
      "Lovely. Pop the kettle on and have a sit-down."
      "Right, that's enough for now. Go for a little walk."
    )
    ERR=(
      "Chin up, love. Try again. You'll sort it."
      "Take a breath. It's just a bug, not the end of the world."
    )
    ;;
  jp)
    START=(
      "おかえりなさい。背筋を伸ばして、お水を飲んでね。"
      "頑張ってね。でも休憩も忘れないで。"
    )
    LATE=(
      "もう遅いよ。早く寝なさい、ね？"
    )
    STOP=(
      "お疲れさま。少し休もうね。"
      "よくやったね。お茶でも飲んで。"
    )
    ERR=(
      "大丈夫、もう一度やってみよう。"
    )
    ;;
  mx)
    START=(
      "Aquí está tu mamá, mijo. Toma agua y siéntate derechito."
      "¡Hola corazón! ¿Ya comiste? Hay tamales en la cocina."
    )
    LATE=(
      "¿A esta hora?! Bueno, pero acuéstate pronto, ¿eh?"
    )
    STOP=(
      "Buen trabajo, mijo. Levántate y camina un poquito."
      "Ya, descansa. Te hice un té de manzanilla."
    )
    ERR=(
      "Tranquilo, mijo, una oración y vuelves a intentar."
    )
    ;;
  de)
    START=(
      "Schatz, gerade Pause gemacht? Trink Wasser, sitz gerade."
      "Hallo Liebling. Vergiss nicht ergonomisch zu sitzen."
    )
    LATE=(
      "Es ist spät, Schatz. Nur noch kurz, dann ab ins Bett."
    )
    STOP=(
      "Gute Arbeit. Jetzt aufstehen und einmal um den Block."
      "Schluss für heute. Tee ist fertig."
    )
    ERR=(
      "Atme tief durch. Versuche es nochmal."
    )
    ;;
  it)
    START=(
      "Tesoro mio! Hai mangiato? Bevi un po' d'acqua!"
      "Eccoti! Stai dritto, su, le spalle indietro."
    )
    LATE=(
      "A quest'ora?! Va bene, ma dormi presto, eh."
    )
    STOP=(
      "Bravo! Adesso alzati e fai due passi, mangia qualcosa."
      "Ottimo lavoro. Vieni che ti faccio una pasta."
    )
    ERR=(
      "Coraggio, tesoro. Riprova con calma."
    )
    ;;
  es)
    START=(
      "Hola cariño, siéntate derecho y bebe agua."
      "Mi vida, ya es hora de comer algo decente."
    )
    LATE=(
      "¡A estas horas! Acuéstate pronto, por favor."
    )
    STOP=(
      "Muy bien. Estira las piernas, mi vida."
      "Hora de descansar. La siesta es sagrada."
    )
    ERR=(
      "Tranquilo, respira y vuelve a intentarlo."
    )
    ;;
  fr)
    START=(
      "Bonjour mon chou ! Tiens-toi droit, bois de l'eau."
      "Tu as mangé ? Allez, au travail, mais avec une pause hein."
    )
    LATE=(
      "À cette heure-ci ? Bon, mais tu te couches vite après."
    )
    STOP=(
      "Bravo. Maintenant, étire-toi et marche un peu."
      "Très bien, viens prendre une tisane."
    )
    ERR=(
      "Allez, respire et recommence, mon chou."
    )
    ;;
  kr)
    START=(
      "엄마 왔어. 자세 똑바로, 물 마셔!"
      "잘 했어. 그래도 좀 쉬어가면서 해."
    )
    LATE=(
      "이 시간에?! 조금만 더 하고 꼭 자야 해."
    )
    STOP=(
      "수고했어. 잠깐 일어나서 걸어 봐."
      "엄마가 차 끓여줄게. 와서 마셔."
    )
    ERR=(
      "괜찮아, 다시 해 봐. 엄마가 믿어."
    )
    ;;
  in)
    START=(
      "Beta, sit straight and drink some water. Did you eat?"
      "Aao beta, kaam karo lekin har ghante uthna padega."
    )
    LATE=(
      "Itni raat ko?! Theek hai, but jaldi so jao."
    )
    STOP=(
      "Shabaash. Ab uth ke thoda chal, paani peeke aao."
      "Bas, ab chai pi lo aur thoda araam karo."
    )
    ERR=(
      "Tension mat lo beta, ek baar phir try karo."
    )
    ;;
  *)
    echo "moooom: unknown MOOOOM_CULTURE='$CULTURE' (supported: ${SUPPORTED[*]}, random)" >&2
    exit 0
    ;;
esac

case "$MODE" in
  start)
    if (( HOUR >= 23 || HOUR < 6 )); then
      MSGS=("${LATE[@]}")
    else
      MSGS=("${START[@]}")
    fi
    ;;
  stop)
    MSGS=("${STOP[@]}")
    ;;
  error)
    MSGS=("${ERR[@]}")
    ;;
  *)
    echo "moooom: unknown mode '$MODE' (start|stop|error)" >&2
    exit 0
    ;;
esac

INDEX=$((RANDOM % ${#MSGS[@]}))
echo "${MSGS[$INDEX]}"
