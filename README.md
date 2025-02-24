# UAV-Fault-Detection

## Descrizione del Progetto

Questo repository contiene il codice MATLAB sviluppato per il progetto "E1 - Rilevamento Guasti nei Droni UAV attraverso l'Analisi del Log di Volo", realizzato nell'ambito del corso di Manutenzione Preventiva per la Robotica e l'Automazione Intelligente dell'Università Politecnica delle Marche, sotto la supervisione del Prof. Alessandro Freddi durante l'anno accademico 2024-2025.

L'obiettivo del progetto è la rilevazione automatizzata di guasti mediante l'analisi dei log di volo di un drone esarotore. Il codice sviluppato si occupa della sincronizzazione dei dati, dell'estrazione delle feature diagnostiche e dell'addestramento di modelli di classificazione per l'identificazione delle anomalie.

## Struttura del Progetto

Il lavoro si suddivide in tre fasi principali:

### 1. Sincronizzazione dei Dati
I log di volo (.mat) contenenti dati da diversi sensori (IMU, VIBE, PWM, ESC, CURR, Attitude, RATE, ecc.) vengono caricati, allineati e sincronizzati tramite la tecnica Zero-Order-Hold (ZOH). I timestamp vengono convertiti in secondi e normalizzati in modo che il primo campione corrisponda a t = 0. Successivamente, viene generato un vettore temporale uniforme a 350 Hz per garantire un'analisi coerente.

### 2. Estrazione delle Feature
Dai dati sincronizzati vengono estratte feature nei domini:
- **Tempo**: media, deviazione standard, RMS, Shape value, Kurtosis, Skewness, Valore di picco, Fattore di impulso, Fattore di cresta e Fattore di clearance.
- **Frequenza**: picco di ampiezza, picco di frequenza e potenza di banda.
Queste caratteristiche permettono di ottenere una rappresentazione numerica utile per l'identificazione dei guasti.
Di queste feature sono state selezionate, attraverso il metodo ANOVA, le prime cinquanta. 

### 3. Addestramento dei Classificatori
Utilizzando le feature estratte, sono stati addestrati diversi modelli di classificazione:
- **Classificatore binario** per l'individuazione della stato di Fault o meno.
- **Classificatore ternario** per l'individuazione del tipo di Fault (NO, 5%, 10%).
- **Classificatore multiclasse** per l'individuazione del motore dannegiato o meno.
È stato effettuato l'addestramento di tutti i modelli disponibili del tool Classification Learner di MATLAB.

## Struttura del Repository

- **main.m** - Script principale per il caricamento dei dataset, definizione dei faultcode e pulizia delle feature.
- **sync.m** - Funzioni per la sincronizzazione dei segnali.
- **datatable.m** - Funzione per la creazione e il caricamento dei dati nella datatable.
- **diagnosticFeatureFinal** - File autogenerato contenente i risultati delle operazioni eseguite sul Diagnostic Feature Designer.
- **DFD Sessions/** - Contiene due sessioni: una con i dati unsync e una con i dati sync.
- **dataset/** - Contiene i dataset utilizzati per l'attività.
- **Classification Sessions/** - Contiene le sessioni con i risultati dei processi di addestramento dei modelli.

## Requisiti

Per eseguire il codice sono necessari:
- MATLAB
- Diagnostic Feature Designer
- Classification Learner

## Autori

- **Francesco Romeo Parisi** (Matr. 1120042)
- **Alessandro Rossini** (Matr. 119002))

