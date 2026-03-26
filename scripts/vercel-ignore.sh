#!/bin/bash

# Vercel sets these environment variables
echo "VERCEL_GIT_COMMIT_REF: $VERCEL_GIT_COMMIT_REF"
echo "VERCEL_GIT_COMMIT_AUTHOR_LOGIN: $VERCEL_GIT_COMMIT_AUTHOR_LOGIN"

# 1. Sprawdź czy branch to 'main'
# (Chociaż vercel.json już to limituje, warto mieć to w skrypcie dla pewności)
if [[ "$VERCEL_GIT_COMMIT_REF" != "main" ]]; then
  echo "🛑 Ignorowanie builda: To nie jest branch main ($VERCEL_GIT_COMMIT_REF)."
  exit 0 # Skip
fi

# 2. Sprawdź czy autor to Jakub (Forestnut)
if [[ "$VERCEL_GIT_COMMIT_AUTHOR_LOGIN" != "Forestnut" ]]; then
  echo "🛑 Ignorowanie builda: Nieautoryzowany autor ($VERCEL_GIT_COMMIT_AUTHOR_LOGIN)."
  exit 0 # Skip
fi

# Jeśli oba warunki spełnione - buduj!
echo "✅ Warunki spełnione. Rozpoczynanie buildu dla $VERCEL_GIT_COMMIT_AUTHOR_LOGIN na branchu $VERCEL_GIT_COMMIT_REF."
exit 1 # Proceed
