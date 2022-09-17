
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
| Ashley   |  4597 |    1933 |  2.38 |
| Laura    | 16540 |    8095 |  2.04 |
| Sam      | 14069 |    7659 |  1.84 |
| Marisha  | 12388 |    7430 |  1.67 |
| Travis   | 12069 |    7302 |  1.65 |
| Liam     | 10472 |    6533 |  1.60 |
| Taliesin | 11979 |    8029 |  1.49 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Ashley   |     4984 |     8776 |  1.76 |
| Laura    |    20731 |    35754 |  1.72 |
| Sam      |    17732 |    28128 |  1.59 |
| Taliesin |    18145 |    26494 |  1.46 |
| Liam     |    16907 |    22924 |  1.36 |
| Marisha  |    21129 |    27736 |  1.31 |
| Travis   |    20255 |    25869 |  1.28 |

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
