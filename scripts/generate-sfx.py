#!/usr/bin/env python3
"""Generate the two missing UI sound effects deterministically (no external assets).

Outputs 16-bit mono WAV files into public/sounds/:
  - click.wav       : short soft UI tick (~40 ms)
  - celebration.wav : ascending arpeggio for wins (~800 ms)

Run:  python3 scripts/generate-sfx.py
"""

import math
import struct
import wave
from pathlib import Path

SAMPLE_RATE = 44_100
OUT_DIR = Path(__file__).resolve().parent.parent / "public" / "sounds"


def write_wav(path: Path, samples: list[float]) -> None:
    with wave.open(str(path), "wb") as wav:
        wav.setnchannels(1)
        wav.setsampwidth(2)
        wav.setframerate(SAMPLE_RATE)
        frames = bytearray()
        for s in samples:
            clamped = max(-1.0, min(1.0, s))
            frames += struct.pack("<h", int(clamped * 32_767))
        wav.writeframes(bytes(frames))


def envelope(i: int, n: int, attack: float, release: float) -> float:
    """Simple linear attack/release envelope over n samples."""
    t = i / n
    a = min(1.0, t / attack) if attack > 0 else 1.0
    r = min(1.0, (1.0 - t) / release) if release > 0 else 1.0
    return a * r


def gen_click() -> list[float]:
    duration = 0.04
    n = int(SAMPLE_RATE * duration)
    freq = 1_800.0
    out = []
    for i in range(n):
        t = i / SAMPLE_RATE
        # fast-decaying sine tick with a touch of a higher partial for "clickiness"
        amp = math.exp(-t * 120)
        s = 0.7 * math.sin(2 * math.pi * freq * t) + 0.3 * math.sin(2 * math.pi * freq * 2 * t)
        out.append(0.35 * amp * s * envelope(i, n, attack=0.02, release=0.5))
    return out


def gen_celebration() -> list[float]:
    notes = [523.25, 659.25, 783.99, 1046.50]  # C5 E5 G5 C6
    note_len = 0.16
    gap = 0.04
    total = len(notes) * note_len + gap * (len(notes) - 1) + 0.15
    n = int(SAMPLE_RATE * total)
    out = [0.0] * n
    for idx, freq in enumerate(notes):
        start = int((note_len + gap) * idx * SAMPLE_RATE)
        ln = int(note_len * SAMPLE_RATE)
        for i in range(ln):
            t = i / SAMPLE_RATE
            amp = math.exp(-t * 6)
            s = math.sin(2 * math.pi * freq * t) + 0.35 * math.sin(2 * math.pi * freq * 2 * t)
            pos = start + i
            if pos < n:
                out[pos] += 0.3 * amp * s * envelope(i, ln, attack=0.15, release=0.4)
    return out


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    write_wav(OUT_DIR / "click.wav", gen_click())
    write_wav(OUT_DIR / "celebration.wav", gen_celebration())
    print(f"Generated click.wav and celebration.wav in {OUT_DIR}")


if __name__ == "__main__":
    main()
