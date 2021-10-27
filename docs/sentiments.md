
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
| Robbie   |    35 |       5 |  7.00 |
| Ashley   |  3121 |    1469 |  2.12 |
| Laura    | 14625 |    7303 |  2.00 |
| Sam      | 12248 |    6877 |  1.78 |
| Marisha  | 10740 |    6679 |  1.61 |
| Travis   | 10189 |    6500 |  1.57 |
| Liam     |  9328 |    5962 |  1.56 |
| Taliesin | 10334 |    7163 |  1.44 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Robbie   |       23 |       80 |  3.48 |
| Laura    |    18482 |    31412 |  1.70 |
| Ashley   |     3907 |     6185 |  1.58 |
| Sam      |    15779 |    24136 |  1.53 |
| Taliesin |    14982 |    22602 |  1.51 |
| Liam     |    15127 |    20569 |  1.36 |
| Marisha  |    18630 |    24242 |  1.30 |
| Travis   |    17551 |    22727 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.
