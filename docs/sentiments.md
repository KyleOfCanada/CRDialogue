
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
| Ashley   |  2454 |    1173 |  2.09 |
| Laura    | 12675 |    6470 |  1.96 |
| Sam      | 10599 |    5988 |  1.77 |
| Marisha  |  9277 |    5680 |  1.63 |
| Liam     |  7716 |    4902 |  1.57 |
| Travis   |  8632 |    5638 |  1.53 |
| Taliesin |  8900 |    6351 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16416 |    27227 |  1.66 |
| Ashley   |     2999 |     4849 |  1.62 |
| Sam      |    13622 |    20689 |  1.52 |
| Taliesin |    13026 |    19393 |  1.49 |
| Liam     |    12827 |    17097 |  1.33 |
| Marisha  |    16002 |    20794 |  1.30 |
| Travis   |    15236 |    19367 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
