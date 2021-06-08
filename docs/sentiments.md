
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
| Ashley   |  2730 |    1307 |  2.09 |
| Laura    | 13253 |    6761 |  1.96 |
| Sam      | 11086 |    6244 |  1.78 |
| Marisha  |  9724 |    6018 |  1.62 |
| Liam     |  8119 |    5184 |  1.57 |
| Travis   |  9125 |    5907 |  1.54 |
| Taliesin |  9276 |    6591 |  1.41 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    17100 |    28486 |  1.67 |
| Ashley   |     3334 |     5358 |  1.61 |
| Sam      |    14252 |    21681 |  1.52 |
| Taliesin |    13601 |    20252 |  1.49 |
| Liam     |    13438 |    17991 |  1.34 |
| Marisha  |    16746 |    21854 |  1.31 |
| Travis   |    16011 |    20297 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
