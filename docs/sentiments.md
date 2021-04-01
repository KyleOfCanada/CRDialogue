
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
| Ashley   |  2492 |    1195 |  2.09 |
| Laura    | 12742 |    6507 |  1.96 |
| Sam      | 10637 |    6009 |  1.77 |
| Marisha  |  9313 |    5702 |  1.63 |
| Liam     |  7768 |    4928 |  1.58 |
| Travis   |  8680 |    5658 |  1.53 |
| Taliesin |  8940 |    6373 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16502 |    27356 |  1.66 |
| Ashley   |     3058 |     4917 |  1.61 |
| Sam      |    13683 |    20751 |  1.52 |
| Taliesin |    13074 |    19477 |  1.49 |
| Liam     |    12901 |    17206 |  1.33 |
| Marisha  |    16056 |    20858 |  1.30 |
| Travis   |    15298 |    19448 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
