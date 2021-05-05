
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
| Ashley   |  2605 |    1250 |  2.08 |
| Laura    | 12967 |    6664 |  1.95 |
| Sam      | 10851 |    6130 |  1.77 |
| Marisha  |  9520 |    5860 |  1.62 |
| Liam     |  7947 |    5071 |  1.57 |
| Travis   |  8884 |    5791 |  1.53 |
| Taliesin |  9076 |    6482 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16843 |    28000 |  1.66 |
| Ashley   |     3213 |     5151 |  1.60 |
| Sam      |    13986 |    21232 |  1.52 |
| Taliesin |    13314 |    19842 |  1.49 |
| Liam     |    13197 |    17637 |  1.34 |
| Marisha  |    16377 |    21367 |  1.30 |
| Travis   |    15656 |    19834 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
