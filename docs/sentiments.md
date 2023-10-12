
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs sad](../plots/joySadPlot.png)

| Name     |   Joy | Sadness | Ratio |
| :------- | ----: | ------: | ----: |
| Ashley   |  6373 |    2490 |  2.56 |
| Laura    | 18985 |    9195 |  2.06 |
| Sam      | 16955 |    8842 |  1.92 |
| Marisha  | 14525 |    8515 |  1.71 |
| Travis   | 14995 |    8876 |  1.69 |
| Liam     | 12139 |    7471 |  1.62 |
| Taliesin | 13802 |    9201 |  1.50 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     6612 |    12690 |  1.92 |
| Laura    |    23751 |    40829 |  1.72 |
| Sam      |    20733 |    33766 |  1.63 |
| Taliesin |    22104 |    30785 |  1.39 |
| Liam     |    19407 |    25977 |  1.34 |
| Marisha  |    24193 |    31576 |  1.31 |
| Travis   |    24782 |    30940 |  1.25 |

Again Liam is near the bottom, but Travis still has a lower score.

-----

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
