#!/bin/bash
# Moooom! Skill Test Suite
# Tests: file structure, content integrity, hook script

PASS=0
FAIL=0
TOTAL=0

assert() {
  TOTAL=$((TOTAL + 1))
  if eval "$2"; then
    echo "  PASS: $1"
    PASS=$((PASS + 1))
  else
    echo "  FAIL: $1"
    FAIL=$((FAIL + 1))
  fi
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL="$SCRIPT_DIR/SKILL.md"
HOOK="$SCRIPT_DIR/moooom-hook.sh"

echo "=== Moooom! Test Suite ==="
echo ""

echo "[1] File Structure"
assert "SKILL.md exists" "[ -f '$SKILL' ]"
assert "moooom-hook.sh exists" "[ -f '$HOOK' ]"
assert "README.md exists" "[ -f '$SCRIPT_DIR/README.md' ]"
assert "LICENSE exists" "[ -f '$SCRIPT_DIR/LICENSE' ]"
echo ""

echo "[2] SKILL.md Frontmatter"
assert "has name: moooom" "grep -q '^name: moooom' '$SKILL'"
assert "has description" "grep -q '^description:' '$SKILL'"
assert "has argument-hint" "grep -q '^argument-hint:' '$SKILL'"
assert "frontmatter opens with ---" "head -1 '$SKILL' | grep -q '^---'"
assert "frontmatter closes with ---" "sed -n '2,10p' '$SKILL' | grep -q '^---'"
echo ""

echo "[3] All 10 Moms Present"
assert "Turkish mom" "grep -q '🇹🇷.*T' '$SKILL'"
assert "American mom" "grep -q '🇺🇸.*American' '$SKILL'"
assert "British mum" "grep -q '🇬🇧.*British' '$SKILL'"
assert "Mexican mama" "grep -q '🇲🇽.*Mexicana' '$SKILL'"
assert "German mutti" "grep -q '🇩🇪.*Deutsche' '$SKILL'"
assert "Italian mamma" "grep -q '🇮🇹.*Italiana' '$SKILL'"
assert "Spanish mama" "grep -q '🇪🇸.*Española' '$SKILL'"
assert "Korean eomma" "grep -q '🇰🇷' '$SKILL'"
assert "Japanese okaasan" "grep -q '🇯🇵' '$SKILL'"
assert "Greek mana" "grep -q '🇬🇷' '$SKILL'"
echo ""

echo "[4] All 5 Moods Present"
assert "random/default mood" "grep -q 'Rastgele' '$SKILL'"
assert "break mood" "grep -q 'Mola' '$SKILL'"
assert "food mood" "grep -q 'Yemek' '$SKILL'"
assert "comfort mood" "grep -q 'Teselli' '$SKILL'"
assert "wisdom mood" "grep -q 'Bilgelik' '$SKILL'"
echo ""

echo "[5] Mom Content Integrity"
assert "Turkish has signature" "grep -q 'Anne seni seviyor' '$SKILL'"
assert "American has signature" "grep -q 'Mom loves you' '$SKILL'"
assert "British has tea reference" "grep -q 'kettle' '$SKILL'"
assert "Mexican has chancla" "grep -q 'chancla' '$SKILL'"
assert "German has Butterbrot" "grep -q 'Butterbrot' '$SKILL'"
assert "Italian has pasta" "grep -q 'pasta' '$SKILL'"
assert "Spanish has siesta" "grep -q 'siesta' '$SKILL'"
assert "Korean has 화이팅" "grep -q '화이팅' '$SKILL'"
assert "Japanese has ね~" "grep -q 'ね~' '$SKILL'"
assert "Greek has ΦΤΟΥ" "grep -q 'ΦΤΟΥ' '$SKILL'"
echo ""

echo "[6] Language Keywords for Selection"
for key in turkish tr american us british uk mexican mx german de italian it spanish es korean kr japanese jp greek gr; do
  assert "keyword '$key' in selection table" "grep -q \"$key\" '$SKILL'"
done
echo ""

echo "[7] Hook Script"
assert "hook is executable or can be" "[ -f '$HOOK' ]"
assert "hook supports 'start' mode" "grep -q 'start)' '$HOOK'"
assert "hook supports 'stop' mode" "grep -q 'stop)' '$HOOK'"
assert "hook supports 'error' mode" "grep -q 'error)' '$HOOK'"
echo ""

echo "[8] Hook Script Execution"
START_OUT=$(bash "$HOOK" start 2>&1)
assert "hook start produces output" "[ -n '$START_OUT' ]"
STOP_OUT=$(bash "$HOOK" stop 2>&1)
assert "hook stop produces output" "[ -n '$STOP_OUT' ]"
ERROR_OUT=$(bash "$HOOK" error 2>&1)
assert "hook error produces output" "[ -n '$ERROR_OUT' ]"
echo ""

echo "[9] Time-Aware Food Feature"
assert "has hour-based food logic" "grep -q '06-10\|11-14\|17-20\|23-06' '$SKILL'"
echo ""

echo "=== Results ==="
echo "Total: $TOTAL | Pass: $PASS | Fail: $FAIL"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "ALL TESTS PASSED"
else
  echo "SOME TESTS FAILED"
  exit 1
fi
