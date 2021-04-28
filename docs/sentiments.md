
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
| Ashley   |  2585 |    1242 |  2.08 |
| Laura    | 12914 |    6635 |  1.95 |
| Sam      | 10817 |    6112 |  1.77 |
| Marisha  |  9491 |    5820 |  1.63 |
| Liam     |  7915 |    5041 |  1.57 |
| Travis   |  8855 |    5776 |  1.53 |
| Taliesin |  9046 |    6463 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16792 |    27893 |  1.66 |
| Ashley   |     3191 |     5118 |  1.60 |
| Sam      |    13932 |    21166 |  1.52 |
| Taliesin |    13277 |    19781 |  1.49 |
| Liam     |    13137 |    17556 |  1.34 |
| Marisha  |    16301 |    21264 |  1.30 |
| Travis   |    15580 |    19766 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
