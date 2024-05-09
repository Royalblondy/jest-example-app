# Zajęcia 06 -  Pipeline: pełna lista kontrolna
---
Klaudia Olma

Po ponad tygodniu walczenia z kodem, a raczej z nieprzechodzącymi testami poprzedniej aplikacji zdecydowałam się na zmianę aplikacji. Więc musiałam nadgonić poprzednie kroki na nowej, a i tak mam wrażenie że wyszło mnie to mniej czasochłonnie.


## Przpomnienie - ścieżka krytyczna
Podstawowy zbiór czynności do wykonania w ramach zadania z pipelinem CI/CD. Ścieżką krytyczną jest:
- [x] commit (lub manual trigger @ Jenkins) - już omawiane w Lab05
- [x] clone - już omawiane w Lab05
- [x] build - już omawiane w Lab05
- [x] test - już omawiane w Lab05
- [ ] deploy
- [ ] publish


## Zadanie - pełna lista kontrolna oraz diagramy UML
Zweryfikuj dotychczasową postać sprawozdania oraz planowane czynności względem ścieżki krytycznej oraz poniższej listy. Realizacja punktu wymaga opisania czynności, wykazania skuteczności (screen), podania poleceń i uzasadnienia decyzji dot. implementacji.

### Diagramy UML (0-4 pkt.)
- [ ] Stworzono diagram komunikacji UML (communication diagram) zawierający sekwencję dla procesu CI/CD, który wykonujesz
- [ ] Stworzono diagram wdrożeniowy UML (deployment diagram) zawierający sekwencję dla procesu CI/CD, który wykonujesz

### Pełna lista kontronla rzeczy do uwzględnienia w pipeline
#### Z Lab05:
- [ ] Aplikacja została wybrana
- [ ] Licencja potwierdza możliwość swobodnego obrotu kodem na potrzeby zadania
- [ ] Wybrany program buduje się
- [ ] Przechodzą dołączone do niego testy
- [ ] Zdecydowano, czy jest potrzebny fork własnej kopii repozytorium
- [ ] Wybrano kontener bazowy lub stworzono odpowiedni kontener wstepny (runtime dependencies)
- [ ] Build został wykonany wewnątrz kontenera
- [ ] Testy zostały wykonane wewnątrz kontenera
- [ ] Kontener testowy jest oparty o kontener build
- [ ] Logi z procesu są odkładane jako numerowany artefakt

#### Z Lab06: (0-6 pkt.)
- [ ] Zdefiniowano kontener 'deploy' służący zbudowanej aplikacji do pracy
- [ ] Uzasadniono czy kontener buildowy nadaje się do tej roli/opisano proces stworzenia nowego
- [ ] Wersjonowany kontener 'deploy' ze zbudowaną aplikacją jest wdrażany na instancję Dockera
- [ ] Następuje weryfikacja, że aplikacja pracuje poprawnie (smoke test)
- [ ] Zdefiniowano, jaki element ma być publikowany jako artefakt
- [ ] Uzasadniono wybór: kontener z programem, plik binarny, flatpak, archiwum tar.gz, pakiet RPM/DEB
- [ ] Opisano proces wersjonowania artefaktu (można użyć semantic versioning)
- [ ] Dostępność artefaktu: publikacja do Rejestru online (dockerhub), artefakt załączony jako rezultat builda w Jenkinsie
- [ ] Przedstawiono sposób na zidentyfikowanie pochodzenia artefaktu
- [ ] Pliki Dockerfile i Jenkinsfile dostępne w repozytrium obok sprawozdania jako osobne pliki
- [ ] Sprawozdanie pozwala zidentyfikować cel podjętych kroków (po co?)
- [ ] Forma sprawozdania umożliwia wykonanie opisanych kroków w jednoznaczny sposób