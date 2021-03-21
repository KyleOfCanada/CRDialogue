
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs
sad](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/joySadPlot.png)

| Name     |   Joy | Sadness | Ratio |
|:---------|------:|--------:|------:|
| Ashley   |  2434 |    1168 |  2.08 |
| Laura    | 12633 |    6448 |  1.96 |
| Sam      | 10560 |    5980 |  1.77 |
| Marisha  |  9248 |    5671 |  1.63 |
| Liam     |  7686 |    4888 |  1.57 |
| Travis   |  8614 |    5630 |  1.53 |
| Taliesin |  8867 |    6328 |  1.40 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs
negative](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    16375 |    27145 |  1.66 |
| Ashley   |     2992 |     4821 |  1.61 |
| Sam      |    13594 |    20595 |  1.52 |
| Taliesin |    12981 |    19323 |  1.49 |
| Liam     |    12793 |    17050 |  1.33 |
| Marisha  |    15975 |    20733 |  1.30 |
| Travis   |    15213 |    19343 |  1.27 |

Again Liam is near the bottom, but Travis still has a lower score.
