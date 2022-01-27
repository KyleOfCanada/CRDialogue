
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
| Ashley   |  3578 |    1611 |  2.22 |
| Robbie   |   438 |     206 |  2.13 |
| Laura    | 15177 |    7461 |  2.03 |
| Sam      | 12727 |    7054 |  1.80 |
| Marisha  | 11200 |    6835 |  1.64 |
| Travis   | 10708 |    6613 |  1.62 |
| Liam     |  9663 |    6090 |  1.59 |
| Taliesin | 10846 |    7414 |  1.46 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    19212 |    32840 |  1.71 |
| Ashley   |     4249 |     6995 |  1.65 |
| Robbie   |      595 |      955 |  1.61 |
| Sam      |    16393 |    25349 |  1.55 |
| Taliesin |    16024 |    23838 |  1.49 |
| Liam     |    15750 |    21354 |  1.36 |
| Marisha  |    19403 |    25400 |  1.31 |
| Travis   |    18199 |    23555 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.

------------------------------------------------------------------------

### References for lexicons

Hu, M., & Liu, B. (2004). Mining and summarizing customer reviews.
Proceedings of the 2004 ACM SIGKDD International Conference on Knowledge
Discovery and Data Mining - KDD ’04, 168.
<https://doi.org/10.1145/1014052.1014073>

Mohammad, S. M., & Turney, P. D. (2013). Crowdsourcing a Word–Emotion
Association Lexicon. Computational Intelligence, 29(3), 436–465.
<https://doi.org/10.1111/j.1467-8640.2012.00460.x>

Nielsen, F. Å. (2011). A new ANEW: Evaluation of a word list for
sentiment analysis in microblogs. ArXiv:1103.2903 \[Cs\].
<http://arxiv.org/abs/1103.2903>
