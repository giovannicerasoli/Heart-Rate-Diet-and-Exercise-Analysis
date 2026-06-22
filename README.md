# Heart Rate, Diet and Exercise Analysis

Progetto di analisi multivariata su misure ripetute delle pulsazioni cardiache in funzione del tipo di dieta e dell’attività fisica svolta.

## Autori

* Giovanni Giacomo Cerasoli
* Alessandro Ricchebono
* Matteo Tacchella

## Dataset e obiettivo

Il dataset comprende **30 persone** assegnate casualmente a:

```r
2 regimi alimentari:
- dieta povera di grassi
- dieta ricca di grassi

3 tipi di esercizio:
- fermo
- camminata
- corsa
```

Le pulsazioni cardiache sono state rilevate in tre momenti successivi:

```r
pulse1 = prima misurazione
pulse2 = dopo 15 minuti
pulse3 = dopo 30 minuti
```

L’obiettivo è valutare l’effetto di tempo, dieta e tipo di esercizio sul numero di pulsazioni.

## Metodologia

L’analisi ha incluso:

* analisi descrittiva e boxplot;
* scatterplot distinti per dieta e attività;
* analisi multivariata per misure ripetute;
* test di sfericità di Mauchly;
* test within-subjects e between-subjects;
* analisi dei contrasti temporali.

## Principali risultati

Le pulsazioni aumentano nel tempo:

```r
pulse1 = 93.13
pulse2 = 101.53
pulse3 = 104.43
```

Il tipo di esercizio è il fattore più rilevante:

* la corsa produce pulsazioni nettamente superiori;
* la camminata mostra valori generalmente più elevati rispetto alla condizione da fermo;
* le differenze diventano più evidenti nelle misurazioni successive.

Il tipo di dieta non risulta significativo nell’analisi within-subjects:

```r
pulse * diet -> p-value = 0.1101
```

Al contrario, l’interazione tra tempo e tipo di esercizio risulta significativa:

```r
pulse * exertype -> p-value < 0.0001
```

## Conclusioni

Il numero di pulsazioni varia significativamente nel tempo ed è influenzato soprattutto dall’intensità dell’esercizio. La dieta mostra un effetto molto più debole rispetto alla modalità di allenamento.

