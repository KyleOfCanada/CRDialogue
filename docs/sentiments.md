
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs sad](../plots/joySadPlot.png)

| Name     |   Joy | Sadness | Ratio |
|:---------|------:|--------:|------:|
| Ashley   |  2530 |    1212 |  2.09 |
| Laura    | 12770 |    6533 |  1.95 |
| Sam      | 10682 |    6046 |  1.77 |
| Marisha  |  9353 |    5732 |  1.63 |
| Liam     |  7795 |    4959 |  1.57 |
| Travis   |  8730 |    5701 |  1.53 |
| Taliesin |  8959 |    6392 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16565 |    27441 |  1.66 |
| Ashley   |     3116 |     4998 |  1.60 |
| Sam      |    13761 |    20858 |  1.52 |
| Taliesin |    13130 |    19540 |  1.49 |
| Liam     |    12964 |    17271 |  1.33 |
| Marisha  |    16125 |    20931 |  1.30 |
| Travis   |    15382 |    19530 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
