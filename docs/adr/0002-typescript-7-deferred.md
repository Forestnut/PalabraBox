# ADR-0002: TypeScript 7 — odroczenie migracji

- **Status:** zaakceptowany (2026-10-07)
- **Kontekst:** TypeScript 7 (przepisanie na Go, projekt „tsgo") jest na `latest` w npm (7.0.2) i oferuje dużą poprawę szybkości. Projekt używa TS 5.9.3.

## Decyzja

Zostajemy na **TypeScript 5.9** do momentu, aż `typescript-eslint` oficjalnie wspiera TS ≥ 7 (obecnie peer-dependency: `typescript >=4.8.4 <6.1.0`).

## Uzasadnienie

- ESLint + typescript-eslint to część CI; migracja wyprzedzająca wsparcie łamałaby pipeline.
- TS 7 jest fresh release — ekosystem (Vite, Vitest, testing library typings) potrzebuje czasu na dojrzenie.
- Zysk (szybkość `tsc`) jest mile widziany, ale nie krytyczny przy projekcie tej wielkości (`tsc -b` < 5 s).

## Rewizja

Sprawdzać przy każdym minor-release `typescript-eslint`; po zniesieniu limitu wykonać migrację jako osobny PR (oczekiwane: brak zmian w kodzie appki, ewentualnie aktualizacja `@types/node`).
