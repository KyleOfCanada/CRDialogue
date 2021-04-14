
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
| Ashley   |  2550 |    1223 |  2.09 |
| Laura    | 12834 |    6583 |  1.95 |
| Sam      | 10731 |    6076 |  1.77 |
| Marisha  |  9406 |    5771 |  1.63 |
| Liam     |  7840 |    4997 |  1.57 |
| Travis   |  8763 |    5721 |  1.53 |
| Taliesin |  8997 |    6420 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16692 |    27685 |  1.66 |
| Ashley   |     3143 |     5043 |  1.60 |
| Sam      |    13831 |    20986 |  1.52 |
| Taliesin |    13186 |    19640 |  1.49 |
| Liam     |    13047 |    17399 |  1.33 |
| Marisha  |    16186 |    21058 |  1.30 |
| Travis   |    15441 |    19604 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
