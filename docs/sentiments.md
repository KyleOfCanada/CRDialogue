
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
| Ashley   |  5386 |    2181 |  2.47 |
| Laura    | 17620 |    8624 |  2.04 |
| Sam      | 15395 |    8226 |  1.87 |
| Marisha  | 13243 |    7836 |  1.69 |
| Travis   | 13328 |    7981 |  1.67 |
| Liam     | 11177 |    6929 |  1.61 |
| Taliesin | 12880 |    8582 |  1.50 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     5715 |    10367 |  1.81 |
| Laura    |    22142 |    38103 |  1.72 |
| Sam      |    19113 |    30711 |  1.61 |
| Taliesin |    20116 |    28636 |  1.42 |
| Liam     |    18044 |    24261 |  1.34 |
| Marisha  |    22482 |    29285 |  1.30 |
| Travis   |    22367 |    28274 |  1.26 |

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
