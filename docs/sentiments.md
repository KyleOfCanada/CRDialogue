
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
| Robbie   |    58 |      16 |  3.62 |
| Ashley   |  3165 |    1484 |  2.13 |
| Laura    | 14679 |    7318 |  2.01 |
| Sam      | 12316 |    6905 |  1.78 |
| Marisha  | 10805 |    6708 |  1.61 |
| Travis   | 10234 |    6521 |  1.57 |
| Liam     |  9392 |    5986 |  1.57 |
| Taliesin | 10398 |    7192 |  1.45 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Robbie   |       86 |      152 |  1.77 |
| Laura    |    18562 |    31515 |  1.70 |
| Ashley   |     3934 |     6241 |  1.59 |
| Sam      |    15842 |    24267 |  1.53 |
| Taliesin |    15082 |    22729 |  1.51 |
| Liam     |    15207 |    20655 |  1.36 |
| Marisha  |    18708 |    24374 |  1.30 |
| Travis   |    17626 |    22825 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.
