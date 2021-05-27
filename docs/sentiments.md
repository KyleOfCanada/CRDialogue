
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
| Ashley   |  2669 |    1279 |  2.09 |
| Laura    | 13097 |    6709 |  1.95 |
| Sam      | 10968 |    6197 |  1.77 |
| Marisha  |  9632 |    5961 |  1.62 |
| Liam     |  8025 |    5117 |  1.57 |
| Travis   |  8993 |    5860 |  1.53 |
| Taliesin |  9155 |    6544 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16973 |    28262 |  1.67 |
| Ashley   |     3275 |     5270 |  1.61 |
| Sam      |    14134 |    21450 |  1.52 |
| Taliesin |    13457 |    20033 |  1.49 |
| Liam     |    13304 |    17800 |  1.34 |
| Marisha  |    16585 |    21641 |  1.30 |
| Travis   |    15862 |    20084 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
