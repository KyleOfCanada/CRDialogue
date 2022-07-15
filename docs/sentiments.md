
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
| Ashley   |  4278 |    1826 |  2.34 |
| Laura    | 16181 |    7905 |  2.05 |
| Sam      | 13707 |    7473 |  1.83 |
| Marisha  | 12057 |    7245 |  1.66 |
| Travis   | 11711 |    7146 |  1.64 |
| Liam     | 10233 |    6401 |  1.60 |
| Taliesin | 11694 |    7867 |  1.49 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Laura    |    20282 |    35022 |  1.73 |
| Ashley   |     4767 |     8136 |  1.71 |
| Sam      |    17366 |    27401 |  1.58 |
| Taliesin |    17541 |    25747 |  1.47 |
| Liam     |    16584 |    22482 |  1.36 |
| Marisha  |    20609 |    27066 |  1.31 |
| Travis   |    19683 |    25250 |  1.28 |

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
