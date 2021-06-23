
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
| Ashley   |  3072 |    1456 |  2.11 |
| Laura    | 14566 |    7283 |  2.00 |
| Sam      | 12183 |    6858 |  1.78 |
| Marisha  | 10695 |    6651 |  1.61 |
| Travis   | 10119 |    6479 |  1.56 |
| Liam     |  9290 |    5950 |  1.56 |
| Taliesin | 10269 |    7138 |  1.44 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    18417 |    31269 |  1.70 |
| Ashley   |     3887 |     6118 |  1.57 |
| Sam      |    15720 |    23966 |  1.52 |
| Taliesin |    14877 |    22474 |  1.51 |
| Liam     |    15084 |    20500 |  1.36 |
| Marisha  |    18549 |    24158 |  1.30 |
| Travis   |    17506 |    22625 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.
