
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
| Robbie   |    88 |      39 |  2.26 |
| Ashley   |  3203 |    1501 |  2.13 |
| Laura    | 14758 |    7369 |  2.00 |
| Sam      | 12391 |    6945 |  1.78 |
| Marisha  | 10881 |    6757 |  1.61 |
| Travis   | 10351 |    6568 |  1.58 |
| Liam     |  9434 |    6015 |  1.57 |
| Taliesin | 10462 |    7236 |  1.45 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    18663 |    31660 |  1.70 |
| Robbie   |      137 |      229 |  1.67 |
| Ashley   |     3972 |     6292 |  1.58 |
| Sam      |    15913 |    24399 |  1.53 |
| Taliesin |    15204 |    22865 |  1.50 |
| Liam     |    15270 |    20728 |  1.36 |
| Marisha  |    18823 |    24561 |  1.30 |
| Travis   |    17728 |    22954 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.
