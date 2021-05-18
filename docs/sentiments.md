
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
| Ashley   |  2642 |    1272 |  2.08 |
| Laura    | 13026 |    6685 |  1.95 |
| Sam      | 10917 |    6172 |  1.77 |
| Marisha  |  9598 |    5902 |  1.63 |
| Liam     |  7998 |    5100 |  1.57 |
| Travis   |  8951 |    5842 |  1.53 |
| Taliesin |  9117 |    6515 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16908 |    28150 |  1.66 |
| Ashley   |     3251 |     5214 |  1.60 |
| Sam      |    14076 |    21348 |  1.52 |
| Taliesin |    13393 |    19941 |  1.49 |
| Liam     |    13264 |    17746 |  1.34 |
| Marisha  |    16483 |    21528 |  1.31 |
| Travis   |    15782 |    19998 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
