# ADR-0003: Dźwięki efekciarskie na natywnym Audio zamiast Howlera

- **Status:** zaakceptowany (2026-10-07)
- **Kontekst:** aplikacja używa Howlera (2.2.4) do 4 krótkich efektów dźwiękowych. Biblioteka nie ma release'u od 2023-09. Ponadto 2 z 4 mapowanych plików (`click.mp3`, `celebration.mp3`) nie istniały w repo — każdy klik generował 404 i leak obiektów `Howl`.

## Decyzja

1. Zastępujemy Howlera cienkim serwisem `sfxService` na **natywnym `HTMLAudioElement`**:
   - preload (cache przeglądarki) raz przy starcie,
   - `play(effect)` czyta głośność ze `settingsStore` w momencie odtwarzania,
   - `stopAll()` pauzuje aktywne instancje,
   - błędy autoplay/decode ignorowane (SFX nie są krytyczne).
2. Brakujące efekty generujemy deterministycznie skryptem `scripts/generate-sfx.py` (Python stdlib, WAV):
   - `click.wav` — miękkie kliknięcie UI (40 ms),
   - `celebration.wav` — arpeggio na wygraną (C5-E5-G5-C6).
3. Globalny dźwięk kliknięcia w `Button` usunięty (decyzja UX — patrz D2 w PLAN.md); dźwięk klik może być odtwarzany punktowo tam, gdzie ma wartość.

## Konsekwencje

- −1 zależność (howler) + −1 @types; mniejszy bundle.
- Pliki dźwiękowe są własne (wygenerowane), brak problemów licencyjnych.
- Regeneracja: `python3 scripts/generate-sfx.py`.

## Odrzucone alternatywy

- Web Audio API (AudioContext + oscylatory w runtime) — bardziej kodu, a pliki WAV są prostsze i cache'owalne.
- Zostanie przy Howlerze — brak utrzymania, zero korzyści przy naszych wymaganiach.
